# Returns the provided query parameters prepared for Ooyala api
#
# Each query requires the following:
#   api_key   - is provided by Ooyala in the Backlot application
#   expires   - time when this request will expire
#   signature - sha of all the parameters (see Signature)
#   any additional query params like 'where, include, etc.'
#
module Tangerine
  module HTTP
    class UrlGenerator

      def self.generate(params)
        new(params).url
      end

      def initialize(params)
        @params = params
      end

      def url
        @url ||= [base_uri, format].join('?')
      end

      private

        def format
          ooyala_requirements!
          format_params_for_url
        end

        def ooyala_requirements!
          authenticator = Tangerine::Authenticator.instance

          @params['expires']   = (Time.now.to_i + 10).to_i
          @params['secret']    = authenticator.secret
          @params['api_key']   = authenticator.api_key
          @params['signature'] = Signature.new(@params).sign
        end

        def format_params_for_url
          @params.delete('request_path')
          @params.delete('secret')

          @params.map { |key, value| "#{key}=#{CGI.escape(value.to_s)}"}.join('&')
        end

        def base_uri
          request_path = @params['request_path']
          "http://api.ooyala.com#{request_path}"
        end
    end
  end
end
