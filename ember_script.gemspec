# -*- encoding: utf-8 -*-
require File.expand_path("../lib/ember_script/version", __FILE__)

Gem::Specification.new do |gem|
  gem.name          = "ember_script"
  gem.version       = EmberScript::VERSION
  gem.authors       = ["Gordon L. Hempton"]
  gem.email         = ["ghempton@gmail.com"]
  gem.date          = Date.today
  gem.description   = "Provides a ruby interface to EmberScript"
  gem.summary       = "EmberScript ruby wrapper"
  gem.homepage      = "http://github.com/ghempton/ember-script-ruby"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_dependency "tilt"

  gem.add_development_dependency "rspec"
end

