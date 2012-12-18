# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'tangerine/version'

Gem::Specification.new do |gem|
  gem.name          = "tangerine"
  gem.version       = Tangerine::VERSION
  gem.authors       = ["Anthony Navarre", "Craig Williams"]
  gem.email         = ["me@anthonynavarre.com", "cwilliams.allancraig@gmail.com"]
  gem.description   = %q{Ooyala Backlot API Wrapper. Read more about the Ooyala Backlot API at http://www.ooyala.com/support/docs/backlot_api}
  gem.summary       = %q{Ooyala Backlot API Wrapper.}
  gem.homepage      = "http://github.com/factorylabs/tangerine"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  # Runtime Dependencies
  gem.add_dependency "activesupport", "~> 3.0.5"
  gem.add_dependency "json"
  gem.add_dependency "i18n", "~> 0.5.0"

  # Development only
  gem.add_development_dependency "rspec"
  gem.add_development_dependency "yard"
  gem.add_development_dependency "bundler"
  gem.add_development_dependency "jeweler"
  gem.add_development_dependency "vcr"
  gem.add_development_dependency "fakeweb"
  gem.add_development_dependency "timecop"
  gem.add_development_dependency "factory_girl"
  gem.add_development_dependency "ruby-debug19"
  gem.add_development_dependency "pry"
end

