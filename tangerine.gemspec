# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{tangerine}
  s.version = "0.6.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Anthony Navarre", "Craig Williams"]
  s.date = %q{2011-04-29}
  s.description = %q{Ooyala Backlot API Wrapper. Read more about the Ooyala Backlot API at http://www.ooyala.com/support/docs/backlot_api}
  s.email = %q{anthony.navarre@factorylabs.com}
  s.extra_rdoc_files = [
    "LICENSE.txt",
    "README.md"
  ]
  s.files = [
    ".document",
    ".pairs",
    ".rspec",
    ".rvmrc",
    "Gemfile",
    "Gemfile.lock",
    "LICENSE.txt",
    "README.md",
    "ROADMAP.md",
    "Rakefile",
    "VERSION",
    "lib/tangerine.rb",
    "lib/tangerine/backlot.rb",
    "lib/tangerine/backlot/base.rb",
    "lib/tangerine/backlot/channel.rb",
    "lib/tangerine/backlot/channel_set.rb",
    "lib/tangerine/backlot/player.rb",
    "lib/tangerine/backlot/video.rb",
    "spec/spec_helper.rb",
    "spec/support/authentication.rb",
    "spec/support/functionally_equivalent.rb",
    "spec/support/tangerine_girl.rb",
    "spec/support/vcr_cassettes/channel_sets/show.yml",
    "spec/support/vcr_cassettes/channels/list.yml",
    "spec/support/vcr_cassettes/query/channel_sets.yml",
    "spec/support/vcr_cassettes/query/embed_code.yml",
    "spec/support/vcr_support.rb",
    "spec/tangerine/backlot_spec.rb",
    "spec/tangerine/base_spec.rb",
    "spec/tangerine/channel_set_spec.rb",
    "spec/tangerine/channel_spec.rb",
    "spec/tangerine/player_spec.rb",
    "spec/tangerine/video_spec.rb",
    "tangerine.gemspec"
  ]
  s.homepage = %q{http://github.com/factorylabs/tangerine}
  s.licenses = ["MIT"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.4.2}
  s.summary = %q{Ooyala Backlot API Wrapper}
  s.test_files = [
    "spec/spec_helper.rb",
    "spec/support/authentication.rb",
    "spec/support/functionally_equivalent.rb",
    "spec/support/tangerine_girl.rb",
    "spec/support/vcr_support.rb",
    "spec/tangerine/backlot_spec.rb",
    "spec/tangerine/base_spec.rb",
    "spec/tangerine/channel_set_spec.rb",
    "spec/tangerine/channel_spec.rb",
    "spec/tangerine/player_spec.rb",
    "spec/tangerine/video_spec.rb"
  ]

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<httparty>, ["~> 0.7.4"])
      s.add_runtime_dependency(%q<activesupport>, ["~> 3.0.5"])
      s.add_runtime_dependency(%q<json>, [">= 1.4.6"])
      s.add_runtime_dependency(%q<i18n>, ["~> 0.5.0"])
      s.add_development_dependency(%q<rspec>, ["~> 2.3.0"])
      s.add_development_dependency(%q<yard>, ["~> 0.6.0"])
      s.add_development_dependency(%q<bundler>, ["~> 1.0.0"])
      s.add_development_dependency(%q<jeweler>, ["~> 1.5.2"])
      s.add_development_dependency(%q<rcov>, [">= 0"])
      s.add_development_dependency(%q<vcr>, ["= 1.7.0"])
      s.add_development_dependency(%q<fakeweb>, ["= 1.3.0"])
      s.add_development_dependency(%q<timecop>, ["= 0.3.5"])
      s.add_development_dependency(%q<factory_girl>, ["= 1.3.3"])
      s.add_development_dependency(%q<ruby-debug>, ["= 0.10.4"])
      s.add_runtime_dependency(%q<httparty>, [">= 0"])
      s.add_runtime_dependency(%q<activesupport>, [">= 0"])
      s.add_runtime_dependency(%q<json>, ["= 1.4.6"])
    else
      s.add_dependency(%q<httparty>, ["~> 0.7.4"])
      s.add_dependency(%q<activesupport>, ["~> 3.0.5"])
      s.add_dependency(%q<json>, [">= 1.4.6"])
      s.add_dependency(%q<i18n>, ["~> 0.5.0"])
      s.add_dependency(%q<rspec>, ["~> 2.3.0"])
      s.add_dependency(%q<yard>, ["~> 0.6.0"])
      s.add_dependency(%q<bundler>, ["~> 1.0.0"])
      s.add_dependency(%q<jeweler>, ["~> 1.5.2"])
      s.add_dependency(%q<rcov>, [">= 0"])
      s.add_dependency(%q<vcr>, ["= 1.7.0"])
      s.add_dependency(%q<fakeweb>, ["= 1.3.0"])
      s.add_dependency(%q<timecop>, ["= 0.3.5"])
      s.add_dependency(%q<factory_girl>, ["= 1.3.3"])
      s.add_dependency(%q<ruby-debug>, ["= 0.10.4"])
      s.add_dependency(%q<httparty>, [">= 0"])
      s.add_dependency(%q<activesupport>, [">= 0"])
      s.add_dependency(%q<json>, ["= 1.4.6"])
    end
  else
    s.add_dependency(%q<httparty>, ["~> 0.7.4"])
    s.add_dependency(%q<activesupport>, ["~> 3.0.5"])
    s.add_dependency(%q<json>, [">= 1.4.6"])
    s.add_dependency(%q<i18n>, ["~> 0.5.0"])
    s.add_dependency(%q<rspec>, ["~> 2.3.0"])
    s.add_dependency(%q<yard>, ["~> 0.6.0"])
    s.add_dependency(%q<bundler>, ["~> 1.0.0"])
    s.add_dependency(%q<jeweler>, ["~> 1.5.2"])
    s.add_dependency(%q<rcov>, [">= 0"])
    s.add_dependency(%q<vcr>, ["= 1.7.0"])
    s.add_dependency(%q<fakeweb>, ["= 1.3.0"])
    s.add_dependency(%q<timecop>, ["= 0.3.5"])
    s.add_dependency(%q<factory_girl>, ["= 1.3.3"])
    s.add_dependency(%q<ruby-debug>, ["= 0.10.4"])
    s.add_dependency(%q<httparty>, [">= 0"])
    s.add_dependency(%q<activesupport>, [">= 0"])
    s.add_dependency(%q<json>, ["= 1.4.6"])
  end
end

