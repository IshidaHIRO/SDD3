class WelcomeController < ApplicationController


  require 'twitter'

  def index
    @result_tweets1 = search_tweets("サラダチキン　ファミマ　おいしい") 
  end

  def search_tweets(query)
    # APIの各種Keyの設定
    # TODO: 暫定で直書き
    client = Twitter::REST::Client.new(
      consumer_key: 'mnDCpUfy63JiypEirQRCgI60W',
      consumer_secret:   'ncL91HshIQCgy5vxXJS3qMJqwINbutLkPtMvioqOjeYcIeWban',
      access_token:        '19013248-gtuzqSQ8jv9VJmtfA9hks8kmJr9jQ33SWzkHMr7Os',
      access_token_secret: 'r3HHV8pHIx9CwBVf6RrDBmfojJMpCNWRBDaCPAe4UA0Pm',
    )

    since_id = nil
    return client.search(query, count: 10, result_type: "recent", exclude: "retweets", since_id: since_id)
    
  end

end
