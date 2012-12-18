module Tangerine
  module HTTP
    class Request
      attr_accessor :params,
        :url_generator,
        :responder,
        :http

      def initialize(params)
        @params = params
      end

      def self.get(params, &block)
        instance = new(params)
        yield instance if block_given?
      end

      def perform!
        responder.parse(response)
      end

      private

      def response
        url = url_generator.generate(@params)
        http.fetch(url)
      end

    end
  end
end
