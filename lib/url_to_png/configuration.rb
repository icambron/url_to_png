require 'faraday'

module UrlToPng
  class Configuration < Faraday::Options.new(
    :api_key,
    :base_url,
    :connection,
    :custom_css,
    :fullpage,
    :say_cheese,
    :secret_key,
    :thumbnail_max_width,
    :unique,
    :user_agent,
    :viewport
  )

    QUERY_OPTIONS = [
      :custom_css,
      :fullpage,
      :say_cheese,
      :thumbnail_max_width,
      :unique,
      :user_agent,
      :viewport
    ]

    options connection: Faraday::ConnectionOptions

    memoized(:connection) { self.class.options_for(:connection).new }

    def configured?
      !api_key.nil? && !secret_key.nil?
    end

    def query_hash
     QUERY_OPTIONS.inject({}) do |hash, item|
       value = send(item)
       if (value)
         hash[item] = send(item)
       end
       hash
     end
    end

  end
end
