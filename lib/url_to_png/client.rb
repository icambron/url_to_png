require 'digest'
require 'addressable/uri'
require 'faraday_middleware'

require 'url_to_png/result'

module UrlToPng
  class Client

    def initialize(inopts = Configuration.new)
      @options = defaults.merge(UrlToPng.configuration).merge(inopts)

      raise "Need to provide an API key and secret" unless @options.configured?
    end

    def middleware
      connection.builder
    end

    def convert(url)
      uri = Addressable::URI.new(query_values: @options.query_hash.merge(url: url))
      token = Digest::MD5.hexdigest(uri.query + @options.secret_key)
      uri.path = "/v6/#{@options.api_key}/#{token}/json/"

      response = connection.get(uri.to_s)
      return Result.new(response.body)
    end

    private


    def defaults
      Configuration.new(base_url: 'api.url2png.com')
    end

    def connection
      @connection ||= Faraday.new("http://#{@options.base_url}", @options.connection) do |builder|
        builder.adapter  :net_http
        builder.response :json, content_type: /\bjson$/
      end
    end

  end
end
