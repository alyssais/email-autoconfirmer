require "json"
require "net/http"
require "uri"

require "bundler"
Bundler.require

post "/message" do
  body = Nokogiri::HTML params["body-html"]
  if link = body.css("a").first
    puts "Clicking link #{link.attr("href")}"
    Net::HTTP.get URI link.attr("href")
  end
end
