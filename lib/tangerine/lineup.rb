# module Tangerine
  # class Lineup
    # attr_reader :embed_code

    # def self.children_for(lineup)
      # embed_codes = new(lineup).child_embed_codes
    # end

    # def initialize(lineup)
      # @embed_code = lineup.embed_code
    # end

    # def child_embed_codes
      # Tangerine::Backlot::API.get("/v2/assets/#{embed_code}/lineup")
    # end

    # def children
      # Tangerine::HTTP::MatchingEmbedCodeQuery.for(embed_codes, params)
    # end

  # end
# end

