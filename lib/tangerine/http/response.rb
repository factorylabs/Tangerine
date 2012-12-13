module Tangerine
  module HTTP
    class Response

      def initialize(response)
        @response = response
      end

      def parse
        JSON.parse @response
      end
    end
  end
end
