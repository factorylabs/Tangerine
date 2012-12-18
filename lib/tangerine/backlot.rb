module Tangerine


  module Backlot

    class API

      def self.authenticate!(credentials)
        Tangerine::Authenticator.instance.activate!(credentials)
      end

      def self.get(request_path, params = {})
        Tangerine::Authenticator.instance.authenticate!

        params['request_path'] = request_path

        Tangerine::HTTP::Request.get(params) do |request|
          request.http          = Tangerine::HTTP::Provider
          request.responder     = Tangerine::HTTP::Response
          request.url_generator = Tangerine::HTTP::UrlGenerator

          request.perform!
        end
      end
    end
  end

  def self.query(options)
    Tangerine::Backlot::API.get('/v2/assets', options)
  end
end

