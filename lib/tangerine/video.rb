class Tangerine::Video < Tangerine::Base
  # LIMIT = 400 # Ooyala limits to 100 by default

  attr_accessor :size,
    :name,
    :thumbnail,
    :content,
    :updated_at,
    :embed_code,
    :description,
    :length,
    :status,
    :uploaded_at,
    :flight_start_time,
    :width,
    :height,
    :labels,
    :metadata,
    :stat

  def initialize(options={})
    @options = options
    add_metadata
    add_labels

    options.delete('metadata')
    options.delete('labels')
    super(options)
  end

  def self.asset_type
    'video'
  end

  def self.query_all
    super "include" => "metadata,labels", "status" => "'live'", 'limit' => LIMIT
  end

  def self.matching_embed_codes(embed_codes, params = {})
    params = default_params.merge(params)
    videos = super(embed_codes, params)

    order_videos!(videos, embed_codes)
  end

  def self.order_videos!(videos, embed_codes)
    embed_codes.map { |code| videos.select { |video| video.embed_code == code }.first }
  end

  def as_json(options = {})
    {
     :size => size,
     :name => name,
     :thumbnail => thumbnail,
     :content => content,
     :updated_at => updated_at,
     :embed_code => embed_code,
     :description => description,
     :length => length,
     :status => status,
     :uploaded_at => uploaded_at,
     :flight_start_time => flight_start_time,
     :width => width,
     :height => height,
     :labels => labels,
     :metadata => metadata,
     :stat => stat
    }
  end

  protected

  def add_labels
    self.labels = @options.fetch('labels', [])
  end

  def add_metadata
    return unless @options['metadata']

    self.metadata = {}
    meta_data = @options['metadata']

    meta_data.each do |key,value|
      key = key.downcase.gsub(' ', '_').to_sym
      self.metadata[key] = value
    end
  end
end
