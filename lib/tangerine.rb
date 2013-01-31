require 'json'
require 'base64'
require 'digest/sha2'
require 'cgi'
require 'net/http'
require 'uri'
require 'singleton'

require 'active_support/inflector'
require 'active_support/hash_with_indifferent_access'
require 'active_support/core_ext'

require_relative 'tangerine/backlot'
require_relative 'tangerine/version'
require_relative 'tangerine/authenticator'

require_relative 'tangerine/http/provider'
require_relative 'tangerine/http/response'
require_relative 'tangerine/http/url_generator'
require_relative 'tangerine/http/request'
require_relative 'tangerine/http/signature'
require_relative 'tangerine/http/matching_embed_code_query'

require_relative 'tangerine/'
require_relative 'tangerine/base'
require_relative 'tangerine/channel'
require_relative 'tangerine/channel_set'
require_relative 'tangerine/video'
require_relative 'tangerine/lineup'

# require '/Users/craig.williams/Documents/Factory/Tangerine/lib/tangerine'
# credentials = {
  # :secret => 'hujlbGtw8o8Hq2FJGNaCNQOWDl3tVAyJjqqhm-mV',
  # :api_key => 'UzbGs6FeXKl3FztSNitFglJAdblv.Tg3cY'
# }
# Tangerine::Backlot::API.authenticate! credentials
# channel_set = Tangerine::ChannelSet.find('9zYmRjMjo9gKl9ZM8wvKlaJxdKm24qZR')
# channel_set.channels
# channel = _.first
# videos = channel.videos
# videos.count

