require 'spec_helper'

describe Tangerine::ChannelSet do

  let(:embed_codes) {
    [
     "M2bDhmMjo-ZrIlkGNNh1YAo168-EsFCU",
     "9zYmRjMjo9gKl9ZM8wvKlaJxdKm24qZR",
     "85aTdiMjoYR5K26Fp8TMgGtGQUCEC2Y1"
    ]
  }
  let(:name)         { 'Expeditions Channel Set' }
  let(:channel_sets) { embed_codes.map { |e| build(:channel_set, embed_code: e) } }

  context 'retreiving channel sets' do

    before { pause_vcr "query/channel_sets"}
    after { play_vcr }

    describe '.all' do
      it 'returns an array of ChannelSet objects' do
        Tangerine::ChannelSet.all.map(&:embed_code).should == channel_sets.map(&:embed_code)
      end
    end

    describe '.find' do
      subject { Tangerine::ChannelSet.find(embed_codes.first) }

      its(:embed_code) { should == embed_codes.first }
      its(:name) { should == name }
    end
  end

  context 'retreiving its channels' do

    before { pause_vcr "channel_sets/show"}
    after { play_vcr }

    describe '#channels' do

      let(:embed_code) { 'M2bDhmMjo-ZrIlkGNNh1YAo168-EsFCU' }
      let(:name) { 'Expeditions' }

      subject { Tangerine::ChannelSet.find(embed_codes.first) }

      it 'returns a list of channels belonging to the channel set' do
        subject.channels.first.name.should == name
      end
    end
  end

  describe '.asset_type' do
    it 'returns the correct asset type' do
      Tangerine::ChannelSet.asset_type.should == 'channel_set'
    end
  end

  describe '#child_lass' do
    it 'returns the correct child class name' do
      build(:channel_set).child_class.should == Tangerine::Channel
    end
  end
end

