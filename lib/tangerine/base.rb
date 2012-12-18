class Tangerine::Base
  LIMIT = 400 # Ooyala limits to 100 by default

  def initialize(options = {})
    options.each do |k,v|
      attr = k.to_s.underscore
      method = :"#{attr}="

      send(method, v) if self.class.method_defined?(method)
    end
  end

  def self.default_params
    { "include" => "metadata,labels", "status" => "'live'", 'limit' => LIMIT }
  end

  def self.find(embed_code)
    result = Tangerine::Backlot::API.get("/v2/assets/#{embed_code}", default_params)
    new(result)
  end

  def self.all
    merged_params = default_params.merge('where' => "asset_type='#{asset_type}'")
    results = Tangerine.query(merged_params)

    results['items'].collect { |item| new(item) }
  end

  def children
    Tangerine::Lineup.children_for(self)
  end

  def title
    warn "#{self.class.name} `#{__method__}` is deprecated.  Please use `name` instead."
    name
  end

  def title=(value)
    warn "#{self.class.name} `#{__method__}` is deprecated.  Please use `name=` instead."
    self.name = value
  end

  def thumbnail
    warn "#{self.class.name} `#{__method__}` is deprecated.  Please use `preview_image_url` instead."
    preview_image_url
  end

  def thumbnail=(value)
    warn "#{self.class.name} `#{__method__}` is deprecated.  Please use `preview_image_url=` instead."
    self.preview_image_url = value
  end
end
