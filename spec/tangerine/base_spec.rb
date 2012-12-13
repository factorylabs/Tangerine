require 'spec_helper'

describe Tangerine::Base do

  context 'class methods' do
    subject { Tangerine::Base }

    describe '.find' do
      before do
        items = []
        5.times { items << mock_item }
        @target_item = {'embed_code' => embed_code}
        items << @target_item

        klass = Class.new(Tangerine::Base) do
          attr_accessor :embed_code
          finder do
            items
          end
        end
        TestBaseClass = klass
      end

      let(:embed_code) { 'target_embed_code' }
      let(:mock_item) { {'embed_code' => FactoryGirl.generate(:embed_code)} }

      it 'returns the object associated with the given embed code' do
        result = TestBaseClass.find(embed_code)
        result.class.should == TestBaseClass
        result.embed_code.should == embed_code
      end
    end
  end
end
