require 'hashie'

module UrlToPng
  class Result < Hashie::Mash

    def initialize(hash)
      hash.delete("_disclaimer_")
      super(hash)
    end

  end
end
