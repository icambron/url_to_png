require 'hashie'

module UrlToPng
  class Result < Hashie::Mash

    def initialize(hash, default = nil)
      hash.delete("_disclaimer_")
      super(hash, default)
    end

  end
end
