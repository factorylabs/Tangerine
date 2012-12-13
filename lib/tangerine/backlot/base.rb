class Tangerine::Base

  def initialize(options = {})
    options.each do |k,v|
      attr = k.to_s.underscore
      method = :"#{attr}="

      send(method, v) if self.class.method_defined?(method)
    end
  end

  def self.query_all
    raise "Implement 'query_all' in subclass"
  end

  def self.query_for(embed_code)
    Tangerine::Backlot::API.get("/v2/assets/#{embed_code}")
  end

  def self.find(embed_code)
    result = query_for(embed_code)
    new(result)
  end

  def self.all
    query_all.collect { |item| new(item) }
  end

  def self.new_up(items)
    items.map { |item| new(item) }
  end

  def self.matching_embed_codes(embed_codes, params = {})
    items = Tangerine::HTTP::MatchingEmbedCodeQuery.for(embed_codes, params)
    new_up(items)
  end

  def lineup_for(embed_code)
    self.class.query_for("#{embed_code}/lineup")
  end

  def title
    warn "[DEPRECATION] `title` is deprecated.  Please use `name` instead."
    name
  end

  def title=(value)
    warn "[DEPRECATION] `title=` is deprecated.  Please use `name=` instead."
    self.name = value
  end
end
