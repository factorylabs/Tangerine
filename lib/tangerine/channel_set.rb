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

  def child_class
    Tangerine::Channel
  end

  def channels
    children
  end

  def as_json(options = {})
    {:channels => channels}
  end

  def to_json(options = {})
    {:channels => channels}.to_json
  end

end
