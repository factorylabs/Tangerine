require 'spec_helper'

describe Tangerine::Channel do
  context 'retrieving videos associated with a channel' do

    describe '#videos' do
      let(:channel_set) do
        FactoryGirl.build(:channel_set)
      end

      let(:channel) do
        FactoryGirl.build(:channel, :embed_code => 'kzbjhmMjrcPl5qxTxTiJkgWno_4GbyJE')
      end

      let(:videos) do
        [
          FactoryGirl.build(:video, :embed_code => embed_codes.first, :name => name),
          FactoryGirl.build(:video, :embed_code => embed_codes[1])
        ]
      end

      let(:embed_codes) { ['I3MHB2MTqP5zvA8dYvzbvGlPJdg7DxRK','Z3Y3l3MTqHOLU6LMeTNbP2O91Oq5ADxm'] }
      let(:name) { "Return to Meru Trailer" }

      before do
        Tangerine::Video.stub(:where).with(:embed_code => embed_codes).and_return(videos)
        channel_set.stub(:channels).and_return([channel])
        pause_vcr "channels/list"
      end
      after { play_vcr }
      subject { channel }

      it 'returns a list of videos belonging to the channel' do
        subject.videos.first.name.should =~ /#{name}/
      end
    end

    describe '.asset_type' do
      it 'returns the correct asset type' do
        Tangerine::Channel.asset_type.should == 'channel'
      end
    end

    describe '#child_lass' do
      it 'returns the correct child class name' do
        build(:channel).child_class.should == Tangerine::Video
      end
    end
  end
end
