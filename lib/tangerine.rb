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

require_relative 'tangerine/authenticator'

require_relative 'tangerine/http/response'
require_relative 'tangerine/http/query_formatter'
require_relative 'tangerine/http/request'
require_relative 'tangerine/http/signature'
require_relative 'tangerine/http/matching_embed_code_query'

require_relative 'tangerine/backlot'
require_relative 'tangerine/backlot/base'
require_relative 'tangerine/backlot/channel'
require_relative 'tangerine/backlot/channel_set'
require_relative 'tangerine/backlot/video'

