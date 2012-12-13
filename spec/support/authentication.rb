def authenticate!
  # Publicly-available Ooyala Provider account creds for testing purposes
  let(:credentials) { {:api_key => 'lsNTrbQBqCQbH-VA6ALCshAHLWrV', :secret => 'hn-Rw2ZH-YwllUYkklL5Zo_7lWJVkrbShZPb5CD1'} }
  before { Tangerine::Backlot::API.authenticate! credentials }
end
