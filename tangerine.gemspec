# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'tangerine/version'

Gem::Specification.new do |gem|
  gem.name          = "tangerine"
  gem.version       = Tangerine::VERSION
  gem.authors       = ["Anthony Navarre", "Craig Williams", "Ken Seal", "Mike Pack"]
  gem.email         = ["me@anthonynavarre.com", "cwilliams.allancraig@gmail.com", "hunzinker@gmail.com", "mikepackdev@gmail.com"]
  gem.description   = %q{Ooyala Backlot API Wrapper. Read more about the Ooyala Backlot API at http://www.ooyala.com/support/docs/backlot_api}
  gem.summary       = %q{Ooyala Backlot API Wrapper.}
  gem.homepage      = "http://github.com/factorylabs/tangerine"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  # Runtime Dependencies
  gem.add_dependency "activesupport", "~> 3.2.13"
  gem.add_dependency "json"
  gem.add_dependency "i18n"

  # Development only
  gem.add_development_dependency "rspec"
  gem.add_development_dependency "yard"
  gem.add_development_dependency "bundler"
  gem.add_development_dependency "vcr"
  gem.add_development_dependency "webmock"
  gem.add_development_dependency "factory_girl"
  gem.add_development_dependency "rake"
end

