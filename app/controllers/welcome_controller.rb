class WelcomeController < ApplicationController

  def index
    item = params[:item]
    if(item.nil? || item == "") 
      item = "サラダチキン"
    end
    @tw_cnt_all1  = get_twitter_cnt(item + "　ファミマ") 
    @tw_cnt_all2  = get_twitter_cnt(item + "　セブンイレブン") 
    @tw_cnt_all3  = get_twitter_cnt(item + "　ローソン")
    @tw_cnt_good1 = get_twitter_cnt(item + "　ファミマ　おいしい")
    @tw_cnt_good2 = get_twitter_cnt(item + "　セブンイレブン　おいしい")
    @tw_cnt_good3 = get_twitter_cnt(item + "　ローソン　おいしい")
    @tw_cnt_bad1  = get_twitter_cnt(item + "　ファミマ　まずい")
    @tw_cnt_bad2  = get_twitter_cnt(item + "　セブンイレブン　まずい")
    @tw_cnt_bad3  = get_twitter_cnt(item + "　ローソン　まずい") 
    
    @product = (self.get_product_hash)[item]

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
    hash["サラダチキン"]["ファミマ"]= Product_dto.new("ファミマ","チキン","サラダチキン","国産鶏のサラダチキン",258,113,nil)
    hash["サラダチキン"]["セブン"]= Product_dto.new("セブン","チキン","サラダチキン","サラダチキン",213,115,nil)
    hash["サラダチキン"]["ローソン"]= Product_dto.new("ローソン","チキン","サラダチキン","サラダチキン",210,125,nil)
    hash["サラダ"]["ファミマ"]= Product_dto.new("ファミマ","サラダ","サラダ","フレッシュ野菜サラダ(ドレッシング別売り）",163,30,nil)
    hash["サラダ"]["セブン"]= Product_dto.new("セブン","サラダ","サラダ","ミックス野菜サラダ(ドレッシング別売り）",163,"-",nil)
    hash["サラダ"]["ローソン"]= Product_dto.new("ローソン","サラダ","サラダ","コーンサラダ(ドレッシング別売り）",148,49,nil) 
    hash["スープ"]["ファミマ"]= Product_dto.new("ファミマ","スープ","スープ","豚汁",298,106,nil)
    hash["スープ"]["セブン"]= Product_dto.new("セブン","スープ","スープ","生姜香る鶏肉と野菜の和風スープ",298,141,nil)
    hash["スープ"]["ローソン"]= Product_dto.new("ローソン","スープ","スープ","Lクラムチャウダー",298,141,nil) 
    hash["おにぎり"]["ファミマ"]= Product_dto.new("ファミマ","おにぎり","おにぎり","紀州南高梅",110,183,nil)
    hash["おにぎり"]["セブン"]= Product_dto.new("セブン","おにぎり","おにぎり","紀州南高梅",110,164,nil)
    hash["おにぎり"]["ローソン"]= Product_dto.new("ローソン","おにぎり","おにぎり","紀州南高梅",110,164,nil)
    hash["パン"]["セブン"]= Product_dto.new("セブン","パン","パン","チョコチップスナック",100,89,nil)
    hash["パン"]["ローソン"]= Product_dto.new("ローソン","パン","パン","チョコチップスティックパン",100,90,nil)
    hash["パン"]["ファミマ"]= Product_dto.new("ファミマ","パン","パン","チョコチップスナック",100,"-",nil)
    return hash
　end
end
end
