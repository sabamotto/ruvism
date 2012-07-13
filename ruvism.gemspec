# coding: utf-8
$:.push File.expand_path("../lib", __FILE__)
require "ruvism/version"

Gem::Specification.new do |s|
  s.name        = "ruvism"
  s.version     = Ruvism::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ['Saba Motto']
  s.email       = ['sabapotcom@yahoo.co.jp']
  s.homepage    = 'http://sky.geocities.jp/gotosun_soft/'
  s.summary     = %q{ruvism extension}
  s.description = %q{ruvism extension}

  s.rubyforge_project = "ruvism"
  
  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ['lib']
end
