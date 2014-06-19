module UrlToPng
  class Configuration < Hashie::Mash

    NON_QUERY_OPTIONS = [
      :secret_key,
      :api_key,
      :base_url,
      :connection
    ]

    def configured?
      !api_key.nil? && !secret_key.nil?
    end

    def query_hash
      select{|key, value| !NON_QUERY_OPTIONS.include?(key)}
    end

  end
end
