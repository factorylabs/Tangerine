$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
$LOAD_PATH.unshift(File.dirname(__FILE__))

require 'rspec'
require 'timecop'
require 'factory_girl'
require 'vcr'
require 'tangerine'
require 'pry'

# Requires supporting files with custom matchers and macros, etc,
# in ./support/ and its subdirectories.
Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each {|f| require f}

VCR.configure do |c|
  c.cassette_library_dir = 'spec/support/vcr_cassettes'
  c.hook_into :fakeweb
end

RSpec.configure do |config|
  config.extend VCR::RSpec::Macros
  config.include FactoryGirl::Syntax::Methods

  config.before(:each) do

    unless example.metadata[:unauthenticated]
      # Publicly-available Ooyala Provider account creds for testing purposes
      # credentials = {:api_key => 'lsNTrbQBqCQbH-VA6ALCshAHLWrV', :secret => 'hn-Rw2ZH-YwllUYkklL5Zo_7lWJVkrbShZPb5CD1'}
      credentials = {
        secret: 'hujlbGtw8o8Hq2FJGNaCNQOWDl3tVAyJjqqhm-mV',
        api_key: 'UzbGs6FeXKl3FztSNitFglJAdblv.Tg3cY'
      }
      Tangerine::Backlot::API.authenticate! credentials
    end
  end
end
