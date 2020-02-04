ENV['APP_ENV'] = 'test'
require_relative '../app.rb'
require 'minitest/autorun'
require 'rack/test'

include Rack::Test::Methods

def app
  Sinatra::Application
end

describe "GET /" do
  it "will response" do
    get ''
    last_response.ok?
    assert_includes last_response.body, 'Twitter Whack'
  end
end

describe "POST on /" do
  it "will redirect" do
    post '/', {
        key_word1: 'hello',
        key_word2: 'world',
    }
    last_response.ok?
    assert last_response.redirect?
  end
end

describe "GET on /result" do
  it "will response a result" do

    get "/result?key_word1=49&key_word2=kansas"
    last_response.ok?
    assert_includes last_response.body, 'Your words (49 and kansas) gave an index of'
  end
end