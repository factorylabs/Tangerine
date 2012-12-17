module Tangerine
  module HTTP
    class Response

      def self.parse(response)
        new(response).parse
      end

      def initialize(response)
        @response = response
      end

      def parse
        JSON.parse @response
      end
    end
  end
end
