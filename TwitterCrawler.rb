require 'twitter'

class TwitterCrawler
    def initialize
        config = {
            consumer_key: "0p1KbfLx2dQW9SxUSRfi8Bi05",
            consumer_secret: "p1V7wQam0Zxs9oaCqYmc9RNUbi14am2EiLmJN2VFdEsmivtgZT"
        }
        @client = Twitter::REST::Client.new(config)
    end

    def search(keyword)
        @client.search(keyword, result_type: "recent").take(100)
    end


end