# -*- encoding: utf-8 -*-
require File.expand_path('../lib/zentask/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Dmitry Gruzd"]
  gem.email         = ["donotsendhere@gmail.com"]
  gem.description   = %q{zengile.com rake tasks}
  gem.summary       = %q{zengile.com rake tasks, we use every day}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "zentask"
  gem.require_paths = ["lib"]
  gem.version       = Zentask::VERSION
end
