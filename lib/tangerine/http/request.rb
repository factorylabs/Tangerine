module Tangerine
  module HTTP
    class Request
      attr_accessor :params,
        :url_generator,
        :responder,
        :http

      def initialize(params)
        @params = params
        yield if block_given?
      end

      def self.get(params)
        new(params).perform_request
      end

      def perform_request
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
