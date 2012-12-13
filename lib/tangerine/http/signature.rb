# Returns the required signature of all params used in the request
#
# Each signature requires the following:
#   secret       - is provided by Ooyala in the Backlot application
#   api_key      - is provided by Ooyala in the Backlot application
#   request_path - '/v2/assets'
#   expires      - time when this request will expire
#   http_method  - GET, POST, PUT, etc
#
class Signature

  def initialize(params)
    @params       = params
    @secret       = params.delete('secret')
    @request_path = params.delete('request_path') || '/v2/assets'
    @http_method  = params.delete('http_method')  || 'GET'
  end

  def sign
    string_to_sign = @secret + @http_method + @request_path

    sorted_params = @params.keys.sort.inject('') do |memo, key|
      memo << "#{key}=#{@params[key]}"
    end

    string_to_sign += sorted_params

    digest = Digest::SHA256.digest(string_to_sign)
    Base64::encode64(digest).chomp.gsub(/=+$/, '')
  end
end
