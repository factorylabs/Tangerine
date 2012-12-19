require 'spec_helper'

describe Tangerine::Base do

  context 'class methods' do
    subject { Tangerine::Base }

    describe '.find' do
      let(:request_path) { "/v2/assets/#{embed_code}" }
      let(:default_params) { Tangerine::Base.default_params }

      before do
        TestBaseClass = Class.new(Tangerine::Base)
        Tangerine::Backlot::API.stub(:get).with(request_path, default_params).and_return('result')
      end
      after { Object.send(:remove_const, :TestBaseClass) }

      let(:embed_code) { 'target_embed_code' }
      let(:mock_item) { {'embed_code' => generate(:embed_code)} }

      it 'initiates an object associated with the given embed code' do
        TestBaseClass.should_receive(:new).with('result')
        TestBaseClass.find(embed_code)
      end

      it 'returns an object associated with the given embed code' do
        fake_tangerine_object = stub

        TestBaseClass.stub(:new).with('result').and_return(fake_tangerine_object)
        TestBaseClass.find(embed_code).should == fake_tangerine_object
      end

    end

    describe '.all' do
    end

  end
end
