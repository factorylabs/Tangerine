require 'spec_helper'

module Tangerine
  module HTTP
    describe Request do

      describe '.get' do
        subject { Request }

        let(:fake_request_object) { double(perform_request: 'response' ) }
        let(:params) { { name: 'Billy' } }

        it 'instantiates a new instance' do
          subject.should_receive(:new).with(params).and_return(fake_request_object)
          subject.get(params)
        end

        it 'returns the response of its instance' do
          subject.stub(:new).with(params).and_return(fake_request_object)
          subject.get(params).should == 'response'
        end

      end

      describe '#perform_request' do
        let(:fake_url) { 'http://www.example.com' }
        let(:fake_response) { "{lorem: 'ipsum'}" }
        let(:fake_parsed_response) { fake_response.to_json }

        let(:fake_responder) { double(parse: fake_parsed_response) }
        let(:fake_url_generator) { double(generate: fake_url) }
        let(:fake_http_provider) { double(fetch: fake_response) }

        subject { Request.new({}) }

        before do
          subject.http = fake_http_provider
          subject.responder = fake_responder
          subject.url_generator = fake_url_generator
        end

        it 'parses the response' do
          fake_responder.should_receive(:parse).with(fake_response)
          subject.perform_request
        end

        it 'returns the parsed response' do
          fake_responder.stub(:parse).with(fake_response).and_return(fake_parsed_response)
          subject.perform_request.should == fake_parsed_response
        end

      end

    end
  end
end

