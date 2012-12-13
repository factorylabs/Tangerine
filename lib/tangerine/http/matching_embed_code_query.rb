# Returns embed_codes ready for querying the Ooyala api
# Embed codes come from Ooyala in double quotes but they
# require them to be in single quotes when querying the api
#
# ex.
# embed_code IN ('F2ZGh1NTrEWW-6eX_8ww7mGsQQhhuQRk', 'lvaDgwMzp1mSeJNyoq9HMrhLKUDqhyMt')
#
module Tangerine
  module HTTP
    class MatchingEmbedCodeQuery

      def initialize(embed_codes, params = {})
        @embed_codes = embed_codes
        @params = params
      end

      def self.for(embed_codes, params)
        query = new(embed_codes, params)
        query.items
      end

      def items
        query_params = @params.merge('where' => prepared_embed_codes)
        Tangerine.query(query_params)['items']
      end

      private

      def prepared_embed_codes
        codes = @embed_codes.map { |e| "'#{CGI.escape(e)}'" }.join(',')

        "embed_code IN (#{codes})"
      end
    end
  end
end
