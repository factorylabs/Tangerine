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
          def query_for(embed_code)
            items
          end
        end
        TestBaseClass = klass
      end

      let(:embed_code) { 'target_embed_code' }
      let(:mock_item) { {'embed_code' => FactoryGirl.generate(:embed_code)} }

      it 'returns the object associated with the given embed code' do
        Tangerine::Base.stub(:query_for).and_return(@target_item)

        result = TestBaseClass.find(embed_code)
        result.class.should == TestBaseClass
      end
    end
  end
end
