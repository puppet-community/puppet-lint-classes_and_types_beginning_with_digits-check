puppet-lint-classes_and_types_beginning_with_digits-check
===============================

[![License](https://img.shields.io/github/license/voxpupuli/puppet-lint-classes_and_types_beginning_with_digits-check.svg)](https://github.com/voxpupuli/puppet-lint-classes_and_types_beginning_with_digits-check/blob/master/LICENSE)
[![codecov](https://codecov.io/gh/voxpupuli/puppet-lint-classes_and_types_beginning_with_digits-check/branch/master/graph/badge.svg)](https://codecov.io/gh/voxpupuli/puppet-lint-classes_and_types_beginning_with_digits-check)
[![Test](https://github.com/voxpupuli/puppet-lint-classes_and_types_beginning_with_digits-check/actions/workflows/test.yml/badge.svg)](https://github.com/voxpupuli/puppet-lint-classes_and_types_beginning_with_digits-check/actions/workflows/test.yml)
[![Release](https://github.com/voxpupuli/puppet-lint-classes_and_types_beginning_with_digits-check/actions/workflows/release.yml/badge.svg)](https://github.com/voxpupuli/puppet-lint-classes_and_types_beginning_with_digits-check/actions/workflows/release.yml)
[![RubyGem Version](https://img.shields.io/gem/v/puppet-lint-classes_and_types_beginning_with_digits-check.svg)](https://rubygems.org/gems/puppet-lint-classes_and_types_beginning_with_digits-check)
[![RubyGem Downloads](https://img.shields.io/gem/dt/puppet-lint-classes_and_types_beginning_with_digits-check.svg)](https://rubygems.org/gems/puppet-lint-classes_and_types_beginning_with_digits-check)
[![Donated by Puppet Inc](https://img.shields.io/badge/donated%20by-Puppet%20Inc-fb7047.svg)](#transfer-notice)

A puppet-lint plugin to check for types and class names that begin with digits.

*This repository is archived, because the plugin is obsolete since Puppet 4. A Puppet compile check should give the same error. The v1.0.0 release is the last one*

## Installing

### From the command line

```shell
$ gem install puppet-lint-classes_and_types_beginning_with_digits-check
```

### In a Gemfile

```ruby
gem 'puppet-lint-classes_and_types_beginning_with_digits-check', :require => false
```

## Checks

### Classes that begin with digits

In the future parser/Puppet 4.0.0 and higher, defined resource types and class
names cannot begin with digits.

#### What you have done

```puppet
class 10apache {}
```

#### What you should have done

```puppet
class apache {}
```


#### Disabling the check

To disable this check, you can add `--no-classes_and_types_beginning_with_digits-check` to your puppet-lint command line.

```shell
$ puppet-lint --no-classes_and_types_beginning_with_digits-check path/to/file.pp
```

Alternatively, if you’re calling puppet-lint via the Rake task, you should insert the following line to your `Rakefile`.

```ruby
PuppetLint.configuration.send('classes_and_types_beginning_with_digits')
```

## Transfer Notice

This plugin was originally authored by [Puppet Inc](http://puppet.com).
The maintainer preferred that Puppet Community take ownership of the module for future improvement and maintenance.
Existing pull requests and issues were transferred over, please fork and continue to contribute here instead of Puppet Inc.

## License

This gem is licensed under the Apache-2 license.

## Release information

To make a new release, please do:
* update the version in the gemspec file
* Install gems with `bundle install --with release --path .vendor`
* generate the changelog with `bundle exec rake changelog`
* Check if the new version matches the closed issues/PRs in the changelog
* Create a PR with it
* After it got merged, push a tag. GitHub actions will do the actual release to rubygems and GitHub Packages
