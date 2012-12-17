module Tangerine
  module HTTP
    class Provider

      def self.fetch(url)
        new(url).fetch
      end

      def initialize(url)
        @uri = URI.parse url
      end

      def fetch
        Net::HTTP.get @uri
      end

    end
  end
end

