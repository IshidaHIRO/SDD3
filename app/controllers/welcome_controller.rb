class WelcomeController < ApplicationController

  def index
    @item = params[:item]
    if(@item.nil? || @item == "") 
      @item = "サラダチキン"
    end
    @tw_cnt_all1 = Rails.cache.fetch("cnt_all1"+@item) do
      get_twitter_cnt(@item + "　ファミマ") 
    end
    @tw_cnt_all2 = Rails.cache.fetch("cnt_all2"+@item) do 
      get_twitter_cnt(@item + "　セブンイレブン") 
    end
    @tw_cnt_all3 = Rails.cache.fetch("cnt_all3"+@item) do
      get_twitter_cnt(@item + "　ローソン") 
    end
    @tw_cnt_good1= Rails.cache.fetch("cnt_good1"+@item) do 
      get_twitter_cnt(@item + "　ファミマ　おいしい") 
    end
    @tw_cnt_good2=Rails.cache.fetch("cnt_good2"+@item) do
      get_twitter_cnt(@item + "　セブンイレブン　おいしい") 
    end
    @tw_cnt_good3=Rails.cache.fetch("cnt_good3"+@item) do 
      get_twitter_cnt(@item + "　ローソン　おいしい") 
    end
    @tw_cnt_bad1=Rails.cache.fetch("cnt_bad1"+@item) do
      get_twitter_cnt(@item + "　ファミマ　まずい") 
    end
    @tw_cnt_bad2=Rails.cache.fetch("cnt_bad2"+@item) do 
      get_twitter_cnt(@item + "　セブンイレブン　まずい") 
    end
    @tw_cnt_bad3=Rails.cache.fetch("cnt_bad3"+@item) do 
      get_twitter_cnt(@item + "　ローソン　まずい") 
    end
    
    @product = (self.get_product_hash)[@item]

  end
  
  def get_twitter_cnt(query)
    # Twitterキーワード検索結果を返す

    # TODO: 暫定で直書き
    client = Twitter::REST::Client.new(
      consumer_key:        'mnDCpUfy63JiypEirQRCgI60W',
      consumer_secret:     'ncL91HshIQCgy5vxXJS3qMJqwINbutLkPtMvioqOjeYcIeWban',
      access_token:        '19013248-gtuzqSQ8jv9VJmtfA9hks8kmJr9jQ33SWzkHMr7Os',
      access_token_secret: 'r3HHV8pHIx9CwBVf6RrDBmfojJMpCNWRBDaCPAe4UA0Pm',
    )

    # 直近１週間のTweet件数を取得
    query <<  "　since:" + (Date.today - 7).strftime("%Y-%m-%d")
    result_tweets = client.search(query, count: nil, result_type: "mixed", exclude: "retweets", since_id: nil)

    return result_tweets.count    


  end
  
  def get_product_hash
    # 品目 => コンビニ => 商品
    hash = Hash.new { |h,k| h[k] = {} }
    hash["サラダチキン"]["ファミマ"]= Product_dto.new("ファミマ","チキン","サラダチキン","国産鶏のサラダチキン",258,113,120,20.8,1.5,2.9,"-","-",836)
    hash["サラダチキン"]["セブン"]= Product_dto.new("セブン","チキン","サラダチキン","サラダチキン",213,115,nil,nil,nil,nil,nil,nil,nil)
    hash["サラダチキン"]["ローソン"]= Product_dto.new("ローソン","チキン","サラダチキン","サラダチキン",210,125,nil,nil,nil,nil,nil,nil,nil)
    hash["サラダ"]["ファミマ"]= Product_dto.new("ファミマ","サラダ","サラダ","フレッシュ野菜サラダ(ドレッシング別売り）",163,30,"-",1.3,0.3,5.4,"-","-",19)
    hash["サラダ"]["セブン"]= Product_dto.new("セブン","サラダ","サラダ","ミックス野菜サラダ(ドレッシング別売り）",163,"-",nil,nil,nil,nil,nil,nil,nil)
    hash["サラダ"]["ローソン"]= Product_dto.new("ローソン","サラダ","サラダ","コーンサラダ(ドレッシング別売り）",148,49,nil,nil,nil,nil,nil,nil,nil) 
    hash["スープ"]["ファミマ"]= Product_dto.new("ファミマ","スープ","スープ","10種具材の豚汁",330,122,"-",9.3,5.8,8.1,"-","-",1.2)
    hash["スープ"]["セブン"]= Product_dto.new("セブン","スープ","スープ","生姜香る鶏肉と野菜の和風スープ",298,141,nil,nil,nil,nil,nil,nil,nil)
    hash["スープ"]["ローソン"]= Product_dto.new("ローソン","スープ","スープ","Lクラムチャウダー",298,141,nil,nil,nil,nil,nil,nil,nil)
    hash["おにぎり"]["ファミマ"]= Product_dto.new("ファミマ","おにぎり","おにぎり","紀州南高梅",110,183,"-",3.5,0.9,40.1,"-","-",788)
    hash["おにぎり"]["セブン"]= Product_dto.new("セブン","おにぎり","おにぎり","紀州南高梅",110,164,nil,nil,nil,nil,nil,nil,nil)
    hash["おにぎり"]["ローソン"]= Product_dto.new("ローソン","おにぎり","おにぎり","紀州南高梅",110,164,nil,nil,nil,nil,nil,nil,nil)
    hash["パン"]["セブン"]= Product_dto.new("セブン","パン","パン","チョコチップスナック",100,89,nil,nil,nil,nil,nil,nil,nil)
    hash["パン"]["ローソン"]= Product_dto.new("ローソン","パン","パン","チョコチップスティックパン",100,90,nil,nil,nil,nil,nil,nil,nil)
    hash["パン"]["ファミマ"]= Product_dto.new("ファミマ","パン","パン","チョコチップスナック",100,89,"-",1.9,3.1,13.4,"-","-",58)
    return hash
　end
end
end
