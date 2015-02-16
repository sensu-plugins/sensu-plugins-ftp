## Sensu-Plugins-ftp

[![Build Status](https://travis-ci.org/sensu-plugins/sensu-plugins-ftp.svg?branch=master)](https://travis-ci.org/sensu-plugins/sensu-plugins-ftp)
[![Gem Version](https://badge.fury.io/rb/sensu-plugins-ftp.svg)](http://badge.fury.io/rb/sensu-plugins-ftp)
[![Code Climate](https://codeclimate.com/github/sensu-plugins/sensu-plugins-ftp/badges/gpa.svg)](https://codeclimate.com/github/sensu-plugins/sensu-plugins-ftp)
[![Test Coverage](https://codeclimate.com/github/sensu-plugins/sensu-plugins-ftp/badges/coverage.svg)](https://codeclimate.com/github/sensu-plugins/sensu-plugins-ftp)
[![Dependency Status](https://gemnasium.com/sensu-plugins/sensu-plugins-ftp.svg)](https://gemnasium.com/sensu-plugins/sensu-plugins-ftp)

## Functionality

## Files
 * bin/check-ftp

## Usage

## Installation

Add the public key (if you haven’t already) as a trusted certificate

```
gem cert --add <(curl -Ls https://raw.githubusercontent.com/sensu-plugins/sensu-plugins.github.io/master/certs/sensu-plugins.pem)
gem install sensu-plugins-ftp -P MediumSecurity
```

You can also download the key from /certs/ within each repository.

#### Rubygems

`gem install sensu-plugins-ftp`

#### Bundler

Add *sensu-plugins-disk-checks* to your Gemfile and run `bundle install` or `bundle update`

#### Chef

Using the Sensu **sensu_gem** LWRP
```
sensu_gem 'sensu-plugins-ftp' do
  options('--prerelease')
  version '0.0.1'
end
```

Using the Chef **gem_package** resource
```
gem_package 'sensu-plugins-ftp' do
  options('--prerelease')
  version '0.0.1'
end
```

## Notes
