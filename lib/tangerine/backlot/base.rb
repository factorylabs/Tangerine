class Tangerine::Base

  def initialize(options={})
    options.delete('content_type') if options['content_type']

    options.each do |k,v|
      attr = k.to_s.underscore
      method = :"#{attr}="

      send(method, v) if self.class.method_defined?(method)
    end
  end

  def self.prepare_items(items)
    Array( items )
  end

  def self.finder(&block)
    @finder = block
  end

  def self.find(embed_code)
    results = prepare_items @finder.call(embed_code)
    found_item = results.select { |item| item['embedCode'] == embed_code }.first
    new(found_item)
  end

  def self.all
    items = prepare_items @finder.call
    items.collect { |item| new(item) }
  end

end
