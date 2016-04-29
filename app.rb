require "json"
require "net/http"
require "uri"

# Make logs output immediately
# Otherwise they sometimes buffer until the process is killed.
$stdout.sync = true

require "bundler"
Bundler.require

post "/message" do
  body = Nokogiri::HTML params["body-html"]
  if link = body.css("a").first
    puts "Clicking link #{link.attr("href")}"
    Net::HTTP.get URI link.attr("href")
  else
    puts "Couldn't find link in body"
    puts body
    puts
  end
end

get "/" do
  "email-autoconfirmer is running!"
end
