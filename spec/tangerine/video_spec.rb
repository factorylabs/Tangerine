require 'spec_helper'

describe Tangerine::Video do

  context 'class methods' do
    subject { Tangerine::Video }
    let(:embed_codes) { ['I3MHB2MTqP5zvA8dYvzbvGlPJdg7DxRK','Z3Y3l3MTqHOLU6LMeTNbP2O91Oq5ADxm'] }

    let(:name) { 'Introducing Kaitlyn Farrington' }

    before { pause_vcr "query/embed_code" }
    after { play_vcr }


    describe '.all' do

      let(:params) { {"include"=>"metadata,labels", "status"=>"'live'", "limit"=>400, "where"=>"asset_type='video'"} }

      it 'returns the response of the query' do
         Tangerine.should_receive(:query).with(params).and_return( stub.as_null_object )
         Tangerine::Video.all
      end

    end

    describe '.find' do

      subject { Tangerine::Video }

      it 'returns the appropriate videos' do
        video = subject.find(embed_codes.first)
        video.name.should =~ /#{name}/
      end
    end

    describe '.new' do

      let(:options) do
        {"flightStartTime"=>"1291860167",
         "size"=>"146499024",
         "name"=>"snowboarding",
         "updatedAt"=>"1294868672",
         "preview_image_url"=>"http://cdn.videos.thenorthface.com/I3MHB2MTqP5zvA8dYvzbvGlPJdg7DxRK/M_-lZjo5g2zgfr_H5hMDoxOjA0O88asB",
         "metadata"=> {
          "metadataItem"=>[{"name"=>"subtitle", "value"=>"Athlete"}, {"name"=>"bigmeta", "value"=>"BigMeta!"}],
         },
         "height"=>"720",
         "embedCode"=>"I3MHB2MTqP5zvA8dYvzbvGlPJdg7DxRK",
         "description"=>"TNF New Team Bio",
         "length"=>"218968",
         "status"=>"live",
         "labels"=>{"label"=>"/YouTube"},
         "stat"=>nil,
         "uploadedAt"=>"1291860167",
         "width"=>"1280"}
      end

      subject { Tangerine::Video.new(options) }
      it 'sets metadata on Video' do
        subject.metadata.should == {:metadataitem=>[{"name"=>"subtitle", "value"=>"Athlete"}, {"name"=>"bigmeta", "value"=>"BigMeta!"}] }
      end

      it 'sets labels on Video' do
        subject.labels.should == { "label" => "/YouTube" }
      end
    end

    describe '.asset_type' do
      it 'returns the correct asset type' do
        Tangerine::Video.asset_type.should == 'video'
      end
    end
  end
end

