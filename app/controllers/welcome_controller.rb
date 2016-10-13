class WelcomeController < ApplicationController

  def index
    # TODO: 検索ワードの規則性に応じてパラメタ化する
    @result_tweets1 = search_tweets("サラダチキン　ファミマ　おいしい") 
    @result_tweets2 = search_tweets("サラダチキン　セブンイレブン　おいしい") 
    @result_tweets3 = search_tweets("サラダチキン　ローソン　おいしい") 
    
    @product = (self.get_product_hash)["サラダキチン"]

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
    return client.search(query, count: 3, result_type: "recent", exclude: "retweets", since_id: since_id)
    
  end
  
  def get_product_hash
    # 品目 => コンビニ => 商品
    hash = Hash.new { |h,k| h[k] = {} }
    hash["サラダキチン"]["ファミマ"]= Product_dto.new("ファミマ","キチン","サラダキチン","国産鶏のサラダチキン",258,113,"R_2230023.jpg")
    hash["サラダキチン"]["セブン"]= Product_dto.new("セブン","キチン","サラダキチン","サラダチキン",213,115,"R_44326.jpg")
    hash["サラダキチン"]["ローソン"]= Product_dto.new("ローソン","キチン","サラダキチン","サラダチキン",210,125,"R_440473_pc.jpg")

    return hash
　end
end
end
