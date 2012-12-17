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

  def self.asset_type
    'channel_set'
  end

  def as_json(options = {})
    {:channels => channels}
  end

  def to_json(options = {})
    {:channels => channels}.to_json
  end

  def channels
    embed_codes = Lineup.child_embed_codes_for(self)
    Tangerine::Channel.matching_embed_codes(embed_codes)
    # Lineup.children_for(self)
  end
end
