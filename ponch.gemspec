# -*- encoding: utf-8 -*-
require File.expand_path('../lib/ponch/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Esteban Pastorino"]
  gem.email         = ["ejpastorino@gmail.com"]
  gem.description   = "Mail analytics"
  gem.summary       = "Mail analytics"
  gem.homepage      = ""

  gem.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.name          = "ponch"
  gem.require_paths = ["lib"]
  gem.version       = Ponch::VERSION

  gem.add_dependency 'railties', ['>= 3.0.0']
  gem.add_dependency 'nokogiri', ['>= 1.4.7']
end
