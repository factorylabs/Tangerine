class Tangerine::ChannelSet < Tangerine::Base

  attr_accessor :embed_code,
    :name,
    :description,
    :status,
    :uploaded_at,
    :size,
    :updated_at,
    :flight_start_time,
    :width,
    :height,
    :stat

  def self.query_all
    Tangerine.query('where' => "asset_type='channel_set'")['items']
  end

  def as_json(options = {})
    {:channels => channels}
  end

  def to_json(options = {})
    {:channels => channels}.to_json
  end

  def channels
    embed_codes = lineup_for(embed_code)
    Tangerine::Channel.matching_embed_codes(embed_codes)
  end
end
