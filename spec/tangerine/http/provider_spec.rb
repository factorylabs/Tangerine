require 'spec_helper'

module Tangerine
  module HTTP
    describe Provider do

      describe '.fetch' do
        subject { Provider }

        let(:url) { 'http://example.com/' }
        let(:fake_http) { double(fetch: 'response') }

        it 'instantiates a new object' do
          subject.should_receive(:new).with(url).and_return(fake_http)
          subject.fetch(url)
        end

        it 'returns the fetched response of its new instance' do
          subject.stub(:new).and_return(fake_http)
          subject.fetch(url).should == 'response'
        end

      end

    end
  end
end

