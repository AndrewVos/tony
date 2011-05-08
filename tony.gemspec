# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "tony/version"

Gem::Specification.new do |s|
  s.name        = "tony"
  s.version     = Tony::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Andrew Vos"]
  s.email       = ["andrew.vos@gmail.com"]
  s.homepage    = "https://github.com/AndrewVos/tony"
  s.summary     = %q{A generator for ruby projects}
  s.description = %q{A generator for ruby projects}

  s.rubyforge_project = "tony"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
  s.bindir        = 'bin'
  s.executables   = ['tony']
  s.add_dependency 'rspec'
end
