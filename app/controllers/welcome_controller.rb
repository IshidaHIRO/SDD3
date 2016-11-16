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
    arr1.push Product_dto.new(1,"ファミマ","惣菜","国産鶏のサラダチキン",239)
    arr1.push Product_dto.new(2,"セブン","惣菜","サラダチキン",198)
    arr1.push Product_dto.new(3,"ローソン","惣菜","サラダチキン",183)
    arr1.push Product_dto.new(4,"ファミマ","惣菜","国産鶏のサラダチキン（3種のハーブ＆スパイス）",239)
    arr1.push Product_dto.new(5,"セブン","惣菜","サラダチキン（ハーブ）",198)
    arr1.push Product_dto.new(6,"ローソン","惣菜","サラダチキン（ハーブ）",195)
    arr1.push Product_dto.new(7,"ファミマ","惣菜","フレッシュ野菜サラダ(ドレッシング別売り）",163)
    arr1.push Product_dto.new(8,"セブン","惣菜","ミックス野菜サラダ(ドレッシング別売り）",163)
    arr1.push Product_dto.new(9,"ローソン","惣菜","コーンサラダ(ドレッシング別売り）",148) 
    arr1.push Product_dto.new(10,"ファミマ","惣菜","10種具材の豚汁",330)
    arr1.push Product_dto.new(11,"セブン","惣菜","生姜香る鶏肉と野菜の和風スープ",298)
    arr1.push Product_dto.new(12,"ローソン","惣菜","Lクラムチャウダー",298)
    hash["惣菜"]=arr1
    arr2 = []
    arr2.push Product_dto.new(13,"ファミマ","おにぎり","紀州南高梅",110)
    arr2.push Product_dto.new(14,"セブン","おにぎり","紀州南高梅",110)
    arr2.push Product_dto.new(15,"ローソン","おにぎり","紀州南高梅",110)
    arr2.push Product_dto.new(16,"ファミマ","おにぎり","和風ツナマヨネーズ",110)
    arr2.push Product_dto.new(17,"セブン","おにぎり","ツナマヨネーズ",110)
    arr2.push Product_dto.new(18,"ローソン","おにぎり","シーチキンマヨネーズ",110)
    arr2.push Product_dto.new(19,"ファミマ","おにぎり","紅しゃけ",140)
    arr2.push Product_dto.new(20,"セブン","おにぎり","紅しゃけ",140)
    arr2.push Product_dto.new(21,"ローソン","おにぎり","さけ",135)
    arr2.push Product_dto.new(22,"ファミマ","おにぎり","北海道産真昆布",110)
    arr2.push Product_dto.new(23,"セブン","おにぎり","日高昆布",110)
    arr2.push Product_dto.new(24,"ローソン","おにぎり","日高昆布",110)
    arr2.push Product_dto.new(25,"ファミマ","おにぎり","納豆",130) 
    arr2.push Product_dto.new(26,"ローソン","おにぎり","納豆",130)
    hash["おにぎり"] = arr2
    arr3 = []
    arr3.push Product_dto.new(27,"ファミマ","スイーツ","チョコチップスナック",100)
    arr3.push Product_dto.new(28,"セブン","スイーツ","チョコチップスナック",100)
    arr3.push  Product_dto.new(29,"ローソン","スイーツ","チョコチップスティックパン",100)
    hash["スイーツ"] = arr3
    arr4 = []
    arr4.push Product_dto.new(30,"ファミマ","ドリンク","プレーンヨーグルトドリンク",nil)
    arr4.push Product_dto.new(31,"セブン","ドリンク","生きて腸まで届く乳酸菌入りのむプレーンヨーグルト",nil)
    arr4.push Product_dto.new(32,"ローソン","ドリンク","生きて腸まで届くビフィズス菌ドリンクヨーグルトプレーン",nil)
    hash["ドリンク"] = arr4
    return hash
　end
end
end
