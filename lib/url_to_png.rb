require "url_to_png/version"
require "url_to_png/client"
require "url_to_png/configuration"

module UrlToPng
  def self.configuration
    @configuration ||= Configuration.new
  end

  def self.configure
    yield configuration
  end

  def self.convert(url, options = {})
    Client.new(options).convert(url)
  end
end
