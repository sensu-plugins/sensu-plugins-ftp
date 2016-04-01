#! /usr/bin/env ruby
#
#   check-ftp
#
# DESCRIPTION:
#   #YELLOW
#
# OUTPUT:
#   plain text
#
# PLATFORMS:
#   Linux
#
# DEPENDENCIES:
#   gem: sensu-plugin
#
# USAGE:
#   example commands
#
# NOTES:
#   Uses either net/ftp or optionally double-bag-ftps ruby gem to check for
#   connectivity to an FTP or FTPS server
#
# LICENSE:
#   S. Zachariah Sprackett <zac@sprackett.com>
#   Released under the same terms as Sensu (the MIT license); see LICENSE
#   for details.
#

require 'sensu-plugin/check/cli'
require 'net/http'
require 'tempfile'
require 'pathname'

class CheckFTP < Sensu::Plugin::Check::CLI
  option :host,
         short: '-H HOST',
         default: 'localhost'
  option :tls,
         short: '-s',
         boolean: true,
         default: false
  option :noverify,
         short: '-n',
         boolean: true,
         default: false
  option :write_file,
         short: '-w',
         boolean: true,
         default: false
  option :passive,
         short: '-x',
         boolean: true,
         default: false
  option :user,
         short: '-u',
         long: '--username USER',
         default: 'anonymous'
  option :pass,
         short: '-p',
         long: '--password PASS'
  option :timeout,
         short: '-t SECS',
         proc: proc(&:to_i),
         default: 15

  def write_file
    file = Tempfile.new("sensu_#{Time.now.to_i}.txt")

    filename = Pathname.new(file.path).basename.to_s

    puts ftp.passive
    file.write("Generated from Sensu at #{Time.now}")
    file.close

    ftp.put(file.path, filename)
    puts ftp.list
    ftp.delete(filename)

    file.unlink
  end

  def run
    begin
      timeout(config[:timeout]) do
        ftp.login(config[:user], config[:pass])
        ftp.passive = config[:passive]
        write_file if config[:write_file]
        ftp.quit
      end
    rescue Timeout::Error
      critical 'Connection timed out'
    rescue => e
      critical "Connection error: #{e.message}"
    end
    ok
  end

  def ftp
    @ftp ||= if config[:tls]
               ftps_login
             else
               ftp_login
             end
  end

  def ftps_login
    require 'double_bag_ftps'
    verify = OpenSSL::SSL::VERIFY_PEER
    verify = OpenSSL::SSL::VERIFY_NONE if config[:noverify]

    begin
      ftps = DoubleBagFTPS.new
      ftps.ssl_context = DoubleBagFTPS.create_ssl_context(
        verify_mode: verify
      )
      ftps.connect(config[:host])
      ftps
    rescue => e
      critical "Failed to log in (#{e.to_s.chomp})"
    end
  end

  def ftp_login
    require 'net/ftp'
    begin
      ftp = Net::FTP.new(config[:host])
      ftp
    rescue => e
      critical "Failed to log in (#{e.to_s.chomp})"
    end
  end
end
