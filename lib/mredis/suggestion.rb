module KdaGem
  module Suggestion
    def self.terms_for(prefix)
      $redis_search.zrevrange "kdagem-suggestions:#{prefix.gsub(" ","").downcase}", 0, 9
    end

    def index_term(term)
      return if term.blank?
      term_search = term.gsub(" ","").downcase
      1.upto(term_search.length) do |n|
        prefix = term_search[0, n]
        $redis_search.zincrby "kdagem-suggestions:#{prefix}", 1, term
      end
    end
  end
end
