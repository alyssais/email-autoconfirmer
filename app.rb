require "json"
require "net/http"
require "uri"

require "bundler"
Bundler.require

post "/message" do
  body = Nokogiri::HTML params["body-html"] 
  if link = body.css("a").first
    Net::HTTP.get URI link.attr("href")
  end
end
