require_relative 'TwitterCrawler.rb'
twitterClient = TwitterCrawler.new
result = twitterClient.search("lol")
puts result[0].user.name
puts result[0].text
puts result[1].url