$:.push File.expand_path("../lib", __FILE__)
require "middleman-breadcrumbs/version"

Gem::Specification.new do |s|
  s.name        = "middleman-breadcrumbs"
  s.version     = BreadcrumbsVersion::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Marnen Laibow-Koser"]
  s.email       = ["marnen@marnen.org"]
  s.homepage    = "http://github.com/marnen/middleman-breadcrumbs"
  s.summary     = %q{Breadcrumbs helper for Middleman}
  s.description = %q{Breadcrumbs helper for Middleman}
  s.license = 'MIT'

  s.required_ruby_version = '>= 2.0'

  s.add_runtime_dependency "middleman", '>= 3.3.5'
  [
    'byebug',
    ['guard', '~> 2.10.5'],
    'guard-minitest',
    ['faker', '~> 1.5.0'],
    'rake'
  ].each {|gem| s.add_development_dependency *gem }

  s.files         = `git ls-files`.split("\n") - %w(.gitignore .hound.yml .hound.ruby.yml .travis.yml)
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = []
  s.require_paths = ["lib"]
end
