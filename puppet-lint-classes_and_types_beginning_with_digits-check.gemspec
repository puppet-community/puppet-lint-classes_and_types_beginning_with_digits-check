Gem::Specification.new do |spec|
  spec.name        = 'puppet-lint-classes_and_types_beginning_with_digits--check'
  spec.version     = '0.1.0'
  spec.homepage    = 'https://github.com/puppet-community/puppet-lint-classes_and_types_beginning_with_digits-check'
  spec.license     = 'Apache-2.0'
  spec.author      = 'Puppet Community'
  spec.email       = 'gary@puppetlabs.com'
  spec.files       = Dir[
    'README.md',
    'LICENSE',
    'lib/**/*',
    'spec/**/*',
  ]
  spec.test_files  = Dir['spec/**/*']
  spec.summary     = 'A puppet-lint plugin to check for classes and defined types that contain names beginning with a digit.'
  spec.description = <<-EOF
    A puppet-lint plugin to check for classes and defined types that contain names beginning with a digit.
  EOF

  spec.add_dependency             'puppet-lint', '>= 1.0', '< 3.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'rspec-its', '~> 1.0'
  spec.add_development_dependency 'rspec-collection_matchers', '~> 1.0'
  spec.add_development_dependency 'mime-types', '~> 1.0' # 2.x dropped Ruby 1.8 support
  spec.add_development_dependency 'coveralls', '~> 0.7' unless RUBY_VERSION =~ /^1\.8/
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'pry'
  spec.add_development_dependency 'pry-nav'
end
