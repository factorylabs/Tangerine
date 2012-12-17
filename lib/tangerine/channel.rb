class Tangerine::Channel < Tangerine::Base

  attr_accessor :size,
    :name,
    :thumbnail,
    :updated_at,
    :embed_code,
    :description,
    :length,
    :status,
    :uploaded_at

  def self.asset_type
    'channel'
  end

  def videos
    embed_codes = lineup_for(embed_code)
    Tangerine::Video.matching_embed_codes(embed_codes)
  end

  def as_json(options = {})
    # TODO: Figure out why rails needs this to be called so badly
    vids = videos

    {
     :size => size,
     :name => name,
     :thumbnail => thumbnail,
     :updated_at => updated_at,
     :embed_code => embed_code,
     :description => description,
     :length => length,
     :status => status,
     :uploaded_at => uploaded_at,
     :videos => vids
    }
  end

end


