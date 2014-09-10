$:.push File.expand_path("../lib", __FILE__)
require "middleman-breadcrumbs/version"

Gem::Specification.new do |s|
  s.name        = "middleman-breadcrumbs"
  s.version     = Breadcrumbs::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Marnen Laibow-Koser"]
  s.email       = ["marnen@marnen.org"]
  s.homepage    = "http://github.com/marnen/middleman-breadcrumbs"
  s.summary     = %q{Breadcrumbs helper for Middleman}
  s.description = %q{Breadcrumbs helper for Middleman}

  s.add_runtime_dependency "middleman", '>= 3.3.5'
  ['guard-minitest', 'ffaker'].each {|gem| s.add_development_dependency gem }

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end