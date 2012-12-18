module Tangerine
  class Lineup
    attr_reader :embed_code, :lineup

    def self.children_for(lineup)
      embed_codes = new(lineup).sort!
    end

    def initialize(lineup)
      @lineup = lineup
      @embed_code = lineup.embed_code
    end

    def sort!
      child_embed_codes.map { |code| children.select { |child| child.embed_code == code }.first }
    end

    private

    def children
      @children ||= fetch_children
    end

    def fetch_children
      assets = Tangerine::HTTP::MatchingEmbedCodeQuery.for(child_embed_codes, Tangerine::Base.default_params)
      assets.map { |asset| lineup.child_class.new(asset) }
    end

    def child_embed_codes
      @embed_codes ||= Tangerine::Backlot::API.get("/v2/assets/#{embed_code}/lineup")
    end

  end
end

