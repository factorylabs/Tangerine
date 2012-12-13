module Tangerine
  module HTTP
    class Request
      attr_accessor :params, :authenticator

      def initialize(params)
        @params        = params
        @authenticator = Tangerine::Authenticator.instance
      end

      def self.get(params)
        new(params).perform_request
      end

      def perform_request
        Response.new(response).parse
      end

      def response
        Net::HTTP.get( URI.parse(url) )
      end

      def url
        @url ||= [base_uri, format_query_params].join('?')
      end

      def base_uri
        request_path = @params['request_path']
        "http://api.ooyala.com#{request_path}"
      end

      def format_query_params
        QueryFormatter.new(self).format
      end
    end
  end
end
