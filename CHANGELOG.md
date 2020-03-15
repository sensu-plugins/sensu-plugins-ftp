# Change Log
This project adheres to [Semantic Versioning](http://semver.org/).

This CHANGELOG follows the format listed at [Our CHANGELOG Guidelines](https://github.com/sensu-plugins/community/blob/master/HOW_WE_CHANGELOG.md).
Which is based on [Keep A Changelog](http://keepachangelog.com/)

## [Unreleased]

### Fixed
- check-ftp.rb: updated to remove deprecation warning (@majormoses)

### Changed
- update location for our changelog format (@majormoses)
- added .bonsai.yml for bonsai.sensu.io compatibility

## [1.1.0] - 2017-05-30
### Added
- check-ftp.rb: add support for implicit FTPS. (@swibowo)
- Add `double-bag-ftps` dependency (@swibowo)

## [1.0.0] - 2017-05-14
### Added
- Add support for writing test files (@sstarcher)
- Support for Ruby 2.3 and 2.4 (@eheydrick)

### Removed
- Support for Ruby 1.9.3 (@eheydrick)

### Changed
- Relax `sensu-plugin` dependency to `~> 1.2` (@mattyjones)
- Rubocop upgrade and cleanup (@eheydrick)

## [0.0.2] - 2015-07-14
### Changed
- updated sensu-plugin gem to 1.2.0

## [0.0.1] - 2015-06-04
### Added
- initial release

[Unreleased]: https://github.com/sensu-plugins/sensu-plugins-ftp/compare/1.1.0...HEAD
[1.1.0]: https://github.com/sensu-plugins/sensu-plugins-ftp/compare/1.0.0...1.1.0
[1.0.0]: https://github.com/sensu-plugins/sensu-plugins-ftp/compare/0.0.2...1.0.0
[0.0.2]: https://github.com/sensu-plugins/sensu-plugins-ftp/compare/0.0.1...0.0.2
