require 'spec_helper'

describe Tangerine::Base do

  context 'class methods' do
    subject { Tangerine::Base }

    describe '.find' do
      let(:target_item) { {'embed_code' => embed_code} }

      before do
        TestBaseClass = Class.new(Tangerine::Base)
        TestBaseClass.stub(:query_for).with(embed_code).and_return(target_item)
      end
      after { Object.send(:remove_const, :TestBaseClass) }

      let(:embed_code) { 'target_embed_code' }
      let(:mock_item) { {'embed_code' => generate(:embed_code)} }

      it 'initiates an object associated with the given embed code' do
        TestBaseClass.should_receive(:new).with(target_item)
        TestBaseClass.find(embed_code)
      end

      it 'returns an object associated with the given embed code' do
        fake_tangerine_object = stub

        TestBaseClass.stub(:new).with(target_item).and_return(fake_tangerine_object)
        TestBaseClass.find(embed_code).should == fake_tangerine_object
      end

    end

    describe '.query_all' do
      it 'raises an error' do
        expect { subject.query_all }.to raise_error(/Implement/)
      end
    end

    describe '.query_for' do
      it 'issues an API call with the given embed code' do
        embed_code = '123456'
        full_path = "/v2/assets/#{embed_code}"
        Tangerine::Backlot::API.should_receive(:get).with(full_path)
        subject.query_for(embed_code)
      end
    end

  end
end
