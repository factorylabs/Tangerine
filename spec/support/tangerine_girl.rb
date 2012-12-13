FactoryGirl.define do
  sequence :embed_code do |n|
    "embed_code_#{n}"
  end
end

FactoryGirl.define do
  factory :channel_set, :class => Tangerine::ChannelSet do
    embed_code FactoryGirl.generate(:embed_code)
    name  "an ode to channelsets"
    description  nil
    flight_start_time  "1294087113"
    height  "3"
    size  nil
    stat  nil
    status  "live"
    updated_at  "1294087113"
    uploaded_at  "1294087113"
    width  "4"
  end
end

FactoryGirl.define do
  factory :channel, :class => Tangerine::Channel do
    embed_code 'lorem ipsum embed'
  end
end

FactoryGirl.define do
  factory :video, :class => Tangerine::Video do
    embed_code 'video embed code'
    name ''
  end
end
