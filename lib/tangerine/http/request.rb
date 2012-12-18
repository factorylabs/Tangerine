module Tangerine
  module HTTP
    class Request
      attr_accessor :params,
        :url_generator,
        :responder,
        :http

      def self.perform!(params)
        request = new(params)
        yield request if block_given?
        request.perform!
      end

      def initialize(params)
        @params = params
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
