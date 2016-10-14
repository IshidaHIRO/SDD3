class WelcomeController < ApplicationController

  def index
    item = params[:item]
    if(item.nil? || item == "") 
      item = "サラダチキン"
    end
    # TODO: 検索ワードの規則性に応じてパラメタ化する    
    @result_tweets1 = search_tweets(item + "　ファミマ　おいしい") 
    @result_tweets2 = search_tweets(item + "　セブンイレブン　おいしい") 
    @result_tweets3 = search_tweets(item + "　ローソン　おいしい") 
    
    @product = (self.get_product_hash)[item]

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
    hash["サラダチキン"]["ファミマ"]= Product_dto.new("ファミマ","チキン","サラダチキン","国産鶏のサラダチキン",258,113,"R_2230023.jpg")
    hash["サラダチキン"]["セブン"]= Product_dto.new("セブン","チキン","サラダチキン","サラダチキン",213,115,"R_44326.jpg")
    hash["サラダチキン"]["ローソン"]= Product_dto.new("ローソン","チキン","サラダチキン","サラダチキン",210,125,"R_440473_pc.jpg")
    hash["サラダ"]["ファミマ"]= Product_dto.new("ファミマ","サラダ","サラダ","フレッシュ野菜サラダ(ドレッシング別売り）",163,30,nil)
    hash["サラダ"]["セブン"]= Product_dto.new("セブン","サラダ","サラダ","ミックス野菜サラダ(ドレッシング別売り）",163,"-",nil)
    hash["サラダ"]["ローソン"]= Product_dto.new("ローソン","サラダ","サラダ","コーンサラダ(ドレッシング別売り）",148,49,nil) 
    hash["スープ"]["ファミマ"]= Product_dto.new("ファミマ","スープ","スープ","豚汁",298,106,nil)
    hash["スープ"]["セブン"]= Product_dto.new("セブン","スープ","スープ","生姜香る鶏肉と野菜の和風スープ",298,141,nil)
    hash["スープ"]["ローソン"]= Product_dto.new("ローソン","スープ","スープ","Lクラムチャウダー",298,141,nil)
    return hash
　end
end
end
