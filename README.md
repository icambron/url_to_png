# UrlToPng

A simple, Faraday-extensible library for accessing the [url2png](https://url2png.com) JSON API.

## Installation

    gem 'url_to_png'

## Usage

```rb
UrlToPng.configure do |config|
  config.api_key = "XXXX"
  config.secret_key = "XXXX"
end

UrlToPng.convert("http://google.com", viewport: "1024x800") #=> a Hashie::Mash
```

There are all kinds of options, and you can use your own Faraday middleware. I'm sure I'll get around to documenting it.

## Tests

There are none! This is not like some philosophical thing; it's just that I didn't bother. So maybe all kinds of things are broken. Who knows?
