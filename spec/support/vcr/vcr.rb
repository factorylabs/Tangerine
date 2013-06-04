require 'vcr'
require_relative 'configuration_variables'

VCR.configure do |config|
  config.hook_into :webmock
  config.cassette_library_dir = VCR_CASSETTE_LIBRARY_DIR
  config.configure_rspec_metadata!
end

def pause_vcr(cassette_name=nil, erb=false)
  VCR.insert_cassette cassette_name,
    :erb => erb,
    record: :new_episodes,
    re_record_interval: 7.days,
    :match_requests_on => [
      :method,
      VCR.request_matchers.uri_without_params(:expires, :signature)
    ]
end

def play_vcr
  VCR.eject_cassette
end
