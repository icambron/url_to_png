require 'faraday'

module UrlToPng
  class Configuration < Hashie::Dash
    property  :api_key
    property  :base_url
    property  :connection, default: {}
    property  :custom_css
    property  :fullpage
    property  :say_cheese
    property  :secret_key
    property  :thumbnail_max_width
    property  :unique
    property  :user_agent
    property  :viewport

    QUERY_OPTIONS = [
      :custom_css,
      :fullpage,
      :say_cheese,
      :thumbnail_max_width,
      :unique,
      :user_agent,
      :viewport
    ]

    def configured?
      !api_key.nil? && !secret_key.nil?
    end

    def query_hash
      select{|key, value| QUERY_OPTIONS.include?(key)}
    end

  end
end
