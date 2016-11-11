class WelcomeController < ApplicationController

  def index
    item = params[:item]
    if(item.nil? || item == "") 
      item = "サラダチキン"
    end
    @product = (self.get_product_hash)[item]
    if(!@product["ファミマ"].nil?)
      @product["ファミマ"].tweets_count_all= Rails.cache.fetch("cnt_all1"+item) do
        get_twitter_cnt(item + "　ファミマ") 
      end
      @product["ファミマ"].tweets_count_good= Rails.cache.fetch("cnt_good1"+item) do 
        get_twitter_cnt(item + "　ファミマ　おいしい") 
      end
      @product["ファミマ"].tweets_count_bad=Rails.cache.fetch("cnt_bad1"+item) do
        get_twitter_cnt(item + "　ファミマ　まずい") 
      end
    end
    if(!@product["セブン"].nil?)
      @product["セブン"].tweets_count_all = Rails.cache.fetch("cnt_all2"+item) do 
        get_twitter_cnt(item + "　セブンイレブン") 
      end
      @product["セブン"].tweets_count_good=Rails.cache.fetch("cnt_good2"+item) do
        get_twitter_cnt(item + "　セブンイレブン　おいしい") 
      end
      @product["セブン"].tweets_count_bad=Rails.cache.fetch("cnt_bad2"+item) do 
        get_twitter_cnt(item + "　セブンイレブン　まずい") 
      end
    end
    if(!@product["ローソン"].nil?)
      @product["ローソン"].tweets_count_all = Rails.cache.fetch("cnt_all3"+item) do
        get_twitter_cnt(item + "　ローソン") 
      end
      @product["ローソン"].tweets_count_good=Rails.cache.fetch("cnt_good3"+item) do 
        get_twitter_cnt(item + "　ローソン　おいしい") 
      end
      @product["ローソン"].tweets_count_bad=Rails.cache.fetch("cnt_bad3"+item) do 
        get_twitter_cnt(item + "　ローソン　まずい") 
      end
    end

    @comparisons = Comparison.where(item: item)

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
    hash["サラダチキン"]["ファミマ"]= Product_dto.new("ファミマ","チキン","サラダチキン","国産鶏のサラダチキン",239,113,120,20.8,1.5,2.9,nil,nil,836)
    hash["サラダチキン"]["セブン"]= Product_dto.new("セブン","チキン","サラダチキン","サラダチキン",198,105,125,23.8,0.9,nil,0.3,nil,468)
    hash["サラダチキン"]["ローソン"]= Product_dto.new("ローソン","チキン","サラダチキン","サラダチキン",183,97,125,26.5,1,nil,1.5,nil,1063)
    hash["サラダチキン（ハーブ）"]["ファミマ"]= Product_dto.new("ファミマ","チキン（ハーブ）","サラダチキン（ハーブ）","国産鶏のサラダチキン（3種のハーブ＆スパイス）",239,133,110,26.1,2.6,1.2,nil,nil,596)
    hash["サラダチキン（ハーブ）"]["セブン"]= Product_dto.new("セブン","チキン（ハーブ）","サラダチキン（ハーブ）","サラダチキン（ハーブ）",198,98,115,22,0.7,nil,0.9,nil,715)
    hash["サラダチキン（ハーブ）"]["ローソン"]= Product_dto.new("ローソン","チキン（ハーブ）","サラダチキン（ハーブ）","サラダチキン（ハーブ）",195,131,125,27.4,1.6,nil,1.4,nil,763)
    hash["サラダ"]["ファミマ"]= Product_dto.new("ファミマ","サラダ","サラダ","フレッシュ野菜サラダ(ドレッシング別売り）",163,30,nil,1.3,0.3,5.4,nil,nil,19)
    hash["サラダ"]["セブン"]= Product_dto.new("セブン","サラダ","サラダ","ミックス野菜サラダ(ドレッシング別売り）",163,23,nil,1,0.4,3.8,nil,nil,33)
    hash["サラダ"]["ローソン"]= Product_dto.new("ローソン","サラダ","サラダ","コーンサラダ(ドレッシング別売り）",148,40,nil,1.8,0.6,5.6,nil,2.3,110) 
    hash["スープ"]["ファミマ"]= Product_dto.new("ファミマ","スープ","スープ","10種具材の豚汁",330,122,nil,9.3,5.8,8.1,nil,nil,1.2)
    hash["スープ"]["セブン"]= Product_dto.new("セブン","スープ","スープ","生姜香る鶏肉と野菜の和風スープ",298,141,nil,nil,nil,nil,nil,nil,1.1)
    hash["スープ"]["ローソン"]= Product_dto.new("ローソン","スープ","スープ","Lクラムチャウダー",298,141,nil,nil,nil,nil,nil,nil,nil)
    hash["おにぎり（梅）"]["ファミマ"]= Product_dto.new("ファミマ","おにぎり","おにぎり（梅）","紀州南高梅",110,183,nil,3.5,0.9,40.1,nil,nil,788)
    hash["おにぎり（梅）"]["セブン"]= Product_dto.new("セブン","おにぎり","おにぎり（梅）","紀州南高梅",110,164,nil,2.7,0.4,37.2,nil,nil,525)
    hash["おにぎり（梅）"]["ローソン"]= Product_dto.new("ローソン","おにぎり","おにぎり（梅）","紀州南高梅",110,164,nil,3.6,0.7,35.8,nil,nil,580)
    hash["おにぎり（ツナ）"]["ファミマ"]= Product_dto.new("ファミマ","おにぎり","おにぎり（ツナ）","和風ツナマヨネーズ",110,239,nil,4.9,5.6,42.2,nil,nil,548)
    hash["おにぎり（ツナ）"]["セブン"]= Product_dto.new("セブン","おにぎり","おにぎり（ツナ）","ツナマヨネーズ",110,225,nil,4.8,5.6,38.8,nil,nil,350)
    hash["おにぎり（ツナ）"]["ローソン"]= Product_dto.new("ローソン","おにぎり","おにぎり（ツナ）","シーチキンマヨネーズ",110,204,nil,4.5,4.7,36.1,nil,nil,570)
    hash["おにぎり（鮭）"]["ファミマ"]= Product_dto.new("ファミマ","おにぎり","おにぎり（紅鮭）","紅しゃけ",140,171,nil,4.9,1.4,34.8,nil,nil,582)
    hash["おにぎり（鮭）"]["セブン"]= Product_dto.new("セブン","おにぎり","おにぎり（紅鮭）","紅しゃけ",140,188,nil,5.2,1.3,38.8,nil,nil,339)
    hash["おにぎり（鮭）"]["ローソン"]= Product_dto.new("ローソン","おにぎり","おにぎり（紅鮭）","さけ",135,174,nil,4.6,1.9,34.5,nil,nil,480)
    hash["おにぎり（昆布）"]["ファミマ"]= Product_dto.new("ファミマ","おにぎり","おにぎり（昆布）","北海道産真昆布",110,186,nil,3.7,0.9,40.6,nil,nil,559)
    hash["おにぎり（昆布）"]["セブン"]= Product_dto.new("セブン","おにぎり","おにぎり（昆布）","日高昆布",110,179,nil,3.5,0.4,40.3,nil,nil,333)
    hash["おにぎり（昆布）"]["ローソン"]= Product_dto.new("ローソン","おにぎり","おにぎり（昆布）","日高昆布",110,173,nil,3.7,1.0,37.4,nil,nil,590)
    hash["おにぎり（納豆巻き）"]["ファミマ"]= Product_dto.new("ファミマ","おにぎり","おにぎり（納豆巻き）","納豆",130,nil,nil,nil,nil,nil,nil,nil,nil)
    hash["おにぎり（納豆巻き）"]["セブン"]= Product_dto.new("セブン","おにぎり","おにぎり（納豆巻き）","-",nil,nil,nil,nil,nil,nil,nil,nil,nil)
    hash["おにぎり（納豆巻き）"]["ローソン"]= Product_dto.new("ローソン","おにぎり","おにぎり（納豆巻き）","納豆",130,184,nil,5.3,2.0,35.9,nil,nil,490)
    hash["パン"]["ファミマ"]= Product_dto.new("ファミマ","パン","パン","チョコチップスナック",100,89,nil,1.9,3.1,13.4,nil,nil,58)
    hash["パン"]["セブン"]= Product_dto.new("セブン","パン","パン","チョコチップスナック",100,89,nil,nil,nil,nil,nil,nil,nil)
    hash["パン"]["ローソン"]= Product_dto.new("ローソン","パン","パン","チョコチップスティックパン",100,90,nil,nil,nil,nil,nil,nil,nil)
    hash["飲むヨーグルト（プレーン）"]["ファミマ"]= Product_dto.new("ファミマ","飲むヨーグルト","プレーン","プレーンヨーグルトドリンク",nil,139,200,6.8,0.7,26.3,nil,nil,111)
    hash["飲むヨーグルト（プレーン）"]["セブン"]= Product_dto.new("セブン","飲むヨーグルト","プレーン","生きて腸まで届く乳酸菌入りのむプレーンヨーグルト",nil,154,180,5.6,4.7,22.3,nil,nil,92)
    hash["飲むヨーグルト（プレーン）"]["ローソン"]= Product_dto.new("ローソン","飲むヨーグルト","プレーン","生きて腸まで届くビフィズス菌ドリンクヨーグルトプレーン",nil,185,270,8.9,2.4,32.4,nil,nil,150)
    return hash
　end
end
end
