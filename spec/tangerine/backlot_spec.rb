require 'spec_helper'

describe Tangerine::Backlot do

  describe 'when not authenticated', unauthenticated: true do
    describe Tangerine::Backlot::API do
      subject { Tangerine::Backlot::API }

      describe '.get' do
        it 'complains about not yet being authenticated' do
          expect{ subject.get('xxxxx') }.to raise_error(Tangerine::NotAuthenticatedError)
        end
      end
    end
  end

  describe 'when authenticated' do

    describe Tangerine::Backlot::API do
      context 'class methods' do
        subject { Tangerine::Backlot::API }

        describe '.get' do

          let(:response) { mock }
          let(:request) { '/some-request-path' }

          it 'returns the HTTP response' do
            Tangerine::HTTP::Request.should_receive(:get).and_return(response)
            subject.get(request).should == response
          end
        end
      end
    end
  end
end

