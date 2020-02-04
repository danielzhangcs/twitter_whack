require 'sinatra'
require_relative 'TwitterCrawler'
require_relative 'comment'

get '/' do
    erb :home
end

post '/' do
    key_word1 = params[:key_word1]
    key_word2 = params[:key_word2]
    redirect "/result?key_word1=#{key_word1}&key_word2=#{key_word2}"
end

get '/result' do
    twitter_client = TwitterCrawler.new
    result1 = twitter_client.search(params[:key_word1])
    result2 = twitter_client.search(params[:key_word2])
    pair = params[:key_word1] + " " +  params[:key_word2]
    result3 = twitter_client.search(pair)
    score = 0
    index = 0
    sample_tweet = "Oops, there are no tweets containing both words"
    user_name = ""
    if result1.size > 0 && result2.size > 0
        score = result1.size * result2.size
    end
    if result3.size > 0
        index = result3.size
        sample_tweet = result3.sample
        user_name = sample_tweet.user.screen_name
        sample_tweet_text = sample_tweet.text
    end
    comments = comment(index)

    erb :result, locals: {score: score, index: index, sample_tweet_text: sample_tweet_text, user_name: user_name, comments: comments, key_word1: params[:key_word1], key_word2: params[:key_word2]}

end