puppet-lint-classes_and_types_beginning_with_digits-check
===============================

[![Gem Version](https://img.shields.io/gem/v/puppet-lint-classes_and_types_beginning_with_digits-check.svg)](https://rubygems.org/gems/puppet-lint-classes_and_types_beginning_with_digits-check)
[![Gem Downloads](https://img.shields.io/gem/dt/puppet-lint-classes_and_types_beginning_with_digits-check.svg)](https://rubygems.org/gems/puppet-lint-classes_and_types_beginning_with_digits-check)
[![Coverage Status](https://img.shields.io/coveralls/puppet-community/puppet-lint-classes_and_types_beginning_with_digits-check.svg)](https://coveralls.io/r/puppet-community/puppet-lint-classes_and_types_beginning_with_digits-check?branch=master)

A puppet-lint plugin to check for types and class names that begin with digits.

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

