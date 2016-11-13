class WelcomeController < ApplicationController

  def index
    @item = params[:item]
    if(@item.nil? || @item == "") 
      @item = "惣菜"
    end
    @product = (self.get_product_hash)[@item]

  end
  
  def get_product_hash
    # 品目 => コンビニ => 商品
    hash = Hash.new { |h,k| h[k] = {} }
    arr1 = []
    arr1.push Product_dto.new("ファミマ","チキン","サラダチキン","国産鶏のサラダチキン",239,113,120,20.8,1.5,2.9,nil,nil,836)
    arr1.push Product_dto.new("セブン","チキン","サラダチキン","サラダチキン",198,105,125,23.8,0.9,nil,0.3,nil,468)
    arr1.push Product_dto.new("ローソン","チキン","サラダチキン","サラダチキン",183,97,125,26.5,1,nil,1.5,nil,1063)
    arr1.push Product_dto.new("ファミマ","チキン（ハーブ）","サラダチキン（ハーブ）","国産鶏のサラダチキン（3種のハーブ＆スパイス）",239,133,110,26.1,2.6,1.2,nil,nil,596)
    arr1.push Product_dto.new("セブン","チキン（ハーブ）","サラダチキン（ハーブ）","サラダチキン（ハーブ）",198,98,115,22,0.7,nil,0.9,nil,715)
    arr1.push Product_dto.new("ローソン","チキン（ハーブ）","サラダチキン（ハーブ）","サラダチキン（ハーブ）",195,131,125,27.4,1.6,nil,1.4,nil,763)
    arr1.push Product_dto.new("ファミマ","サラダ","サラダ","フレッシュ野菜サラダ(ドレッシング別売り）",163,30,nil,1.3,0.3,5.4,nil,nil,19)
    arr1.push Product_dto.new("セブン","サラダ","サラダ","ミックス野菜サラダ(ドレッシング別売り）",163,23,nil,1,0.4,3.8,nil,nil,33)
    arr1.push Product_dto.new("ローソン","サラダ","サラダ","コーンサラダ(ドレッシング別売り）",148,40,nil,1.8,0.6,5.6,nil,2.3,110) 
    arr1.push Product_dto.new("ファミマ","スープ","スープ","10種具材の豚汁",330,122,nil,9.3,5.8,8.1,nil,nil,1.2)
    arr1.push Product_dto.new("セブン","スープ","スープ","生姜香る鶏肉と野菜の和風スープ",298,141,nil,nil,nil,nil,nil,nil,1.1)
    arr1.push Product_dto.new("ローソン","スープ","スープ","Lクラムチャウダー",298,141,nil,nil,nil,nil,nil,nil,nil)
    hash["惣菜"]=arr1
    arr2 = []
    arr2.push Product_dto.new("ファミマ","おにぎり","おにぎり（梅）","紀州南高梅",110,183,nil,3.5,0.9,40.1,nil,nil,788)
    arr2.push Product_dto.new("セブン","おにぎり","おにぎり（梅）","紀州南高梅",110,164,nil,2.7,0.4,37.2,nil,nil,525)
    arr2.push Product_dto.new("ローソン","おにぎり","おにぎり（梅）","紀州南高梅",110,164,nil,3.6,0.7,35.8,nil,nil,580)
    arr2.push Product_dto.new("ファミマ","おにぎり","おにぎり（ツナ）","和風ツナマヨネーズ",110,239,nil,4.9,5.6,42.2,nil,nil,548)
    arr2.push Product_dto.new("セブン","おにぎり","おにぎり（ツナ）","ツナマヨネーズ",110,225,nil,4.8,5.6,38.8,nil,nil,350)
    arr2.push Product_dto.new("ローソン","おにぎり","おにぎり（ツナ）","シーチキンマヨネーズ",110,204,nil,4.5,4.7,36.1,nil,nil,570)
    arr2.push Product_dto.new("ファミマ","おにぎり","おにぎり（紅鮭）","紅しゃけ",140,171,nil,4.9,1.4,34.8,nil,nil,582)
    arr2.push Product_dto.new("セブン","おにぎり","おにぎり（紅鮭）","紅しゃけ",140,188,nil,5.2,1.3,38.8,nil,nil,339)
    arr2.push Product_dto.new("ローソン","おにぎり","おにぎり（紅鮭）","さけ",135,174,nil,4.6,1.9,34.5,nil,nil,480)
    arr2.push Product_dto.new("ファミマ","おにぎり","おにぎり（昆布）","北海道産真昆布",110,186,nil,3.7,0.9,40.6,nil,nil,559)
    arr2.push Product_dto.new("セブン","おにぎり","おにぎり（昆布）","日高昆布",110,179,nil,3.5,0.4,40.3,nil,nil,333)
    arr2.push Product_dto.new("ローソン","おにぎり","おにぎり（昆布）","日高昆布",110,173,nil,3.7,1.0,37.4,nil,nil,590)
    arr2.push Product_dto.new("ファミマ","おにぎり","おにぎり（納豆巻き）","納豆",130,nil,nil,nil,nil,nil,nil,nil,nil)
    arr2.push Product_dto.new("セブン","おにぎり","おにぎり（納豆巻き）","-",nil,nil,nil,nil,nil,nil,nil,nil,nil)
    arr2.push Product_dto.new("ローソン","おにぎり","おにぎり（納豆巻き）","納豆",130,184,nil,5.3,2.0,35.9,nil,nil,490)
    hash["おにぎり"] = arr2
    arr3 = []
    arr3.push Product_dto.new("ファミマ","パン","パン","チョコチップスナック",100,89,nil,1.9,3.1,13.4,nil,nil,58)
    arr3.push Product_dto.new("セブン","パン","パン","チョコチップスナック",100,89,nil,nil,nil,nil,nil,nil,nil)
    arr3.push  Product_dto.new("ローソン","パン","パン","チョコチップスティックパン",100,90,nil,nil,nil,nil,nil,nil,nil)
    hash["スイーツ"] = arr3
    arr4 = []
    arr4.push Product_dto.new("ファミマ","飲むヨーグルト","プレーン","プレーンヨーグルトドリンク",nil,139,200,6.8,0.7,26.3,nil,nil,111)
    arr4.push Product_dto.new("セブン","飲むヨーグルト","プレーン","生きて腸まで届く乳酸菌入りのむプレーンヨーグルト",nil,154,180,5.6,4.7,22.3,nil,nil,92)
    arr4.push Product_dto.new("ローソン","飲むヨーグルト","プレーン","生きて腸まで届くビフィズス菌ドリンクヨーグルトプレーン",nil,185,270,8.9,2.4,32.4,nil,nil,150)
    hash["ドリンク"] = arr4
    return hash
　end
end
end
