module Tangerine
  class NotAuthenticatedError < RuntimeError; end

  class Authenticator
    include Singleton

    attr_accessor :secret, :api_key

    def activate!(credentials)
      creds = HashWithIndifferentAccess.new credentials

      self.secret  = creds[:secret]
      self.api_key = creds[:api_key]
    end

    def authenticated?
      secret && api_key
    end

    def authenticate!
      raise NotAuthenticatedError unless authenticated?
    end
  end
end
