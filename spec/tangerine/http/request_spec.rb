require 'spec_helper'

describe Tangerine::HTTP::Request do
  subject { Tangerine::HTTP::Request }
  its(:base_uri) { should == 'http://api.ooyala.com/v2/assets' }
end

