require 'test_helper'

class WelcomeControllerTest < ActionController::TestCase
  def init(item)
    Rails.cache.write("cnt_all1"+item,100)
    Rails.cache.write("cnt_all2"+item,50)
    Rails.cache.write("cnt_all3"+item,10)
    Rails.cache.write("cnt_good1"+item,50)
    Rails.cache.write("cnt_good2"+item,20)
    Rails.cache.write("cnt_good3"+item,5)
    Rails.cache.write("cnt_bad1"+item,10)
    Rails.cache.write("cnt_bad2"+item,5)
    Rails.cache.write("cnt_bad3"+item,1) 
  end
  
  test "Indexの表示" do
    init("サラダキチン")
    get :index
    assert_response :success
    assert_select "div.shadow_famima div.product p.p_name" ,"国産鶏のサラダチキン"
    assert_select "div.shadow_seven div.product p.p_name" ,"サラダチキン"
    assert_select "div.shadow_lawson div.product p.p_name" ,"サラダチキン"
    assert_select "span.first"
  end
  test "サラダチキンの表示" do
    init("サラダキチン")
    get :index,{"item"=>"サラダチキン"}
    assert_response :success 
    assert_select "div.shadow_famima div.product p.p_name" ,"国産鶏のサラダチキン"
    assert_select "div.shadow_seven div.product p.p_name" ,"サラダチキン"
    assert_select "div.shadow_lawson div.product p.p_name" ,"サラダチキン"
    assert_select "span.first"
  end 
  test "サラダの表示" do
    init("サラダ")
    get :index,{"item"=>"サラダ"}
    assert_response :success 
    assert_select "div.shadow_famima div.product p.p_name" ,"フレッシュ野菜サラダ(ドレッシング別売り）"
    assert_select "div.shadow_seven div.product p.p_name" ,"ミックス野菜サラダ(ドレッシング別売り）"
    assert_select "div.shadow_lawson div.product p.p_name" ,"コーンサラダ(ドレッシング別売り）"
    assert_select "span.first"
  end 
  test "スープの表示" do
    init("スープ")
    get :index,{"item"=>"スープ"}
    assert_response :success 
    assert_select "div.shadow_famima div.product p.p_name" ,"10種具材の豚汁"
    assert_select "div.shadow_seven div.product p.p_name" ,"生姜香る鶏肉と野菜の和風スープ"
    assert_select "div.shadow_lawson div.product p.p_name" ,"Lクラムチャウダー"
    assert_select "span.first"
  end 
  test "おにぎり（梅）の表示" do
    init("おにぎり（梅）")
    get :index,{"item"=>"おにぎり（梅）"}
    assert_response :success 
    assert_select "div.shadow_famima div.product p.p_name" ,"紀州南高梅"
    assert_select "div.shadow_seven div.product p.p_name" ,"紀州南高梅"
    assert_select "div.shadow_lawson div.product p.p_name" ,"紀州南高梅"
    assert_select "span.first"
  end 
  test "おにぎり（ツナ）の表示" do
    init("おにぎり（ツナ）")
    get :index,{"item"=>"おにぎり（ツナ）"}
    assert_response :success 
    assert_select "div.shadow_famima div.product p.p_name" ,"和風ツナマヨネーズ"
    assert_select "div.shadow_seven div.product p.p_name" ,"ツナマヨネーズ"
    assert_select "div.shadow_lawson div.product p.p_name" ,"シーチキンマヨネーズ"
    assert_select "span.first"
  end 
  test "おにぎり（昆布）の表示" do
    init("おにぎり（昆布）")
    get :index,{"item"=>"おにぎり（昆布）"}
    assert_response :success 
    assert_select "div.shadow_famima div.product p.p_name" ,"北海道産真昆布"
    assert_select "div.shadow_seven div.product p.p_name" ,"日高昆布"
    assert_select "div.shadow_lawson div.product p.p_name" ,"日高昆布"
    assert_select "span.first"
  end 
  test "おにぎり（納豆巻き）の表示" do
    init("おにぎり（納豆巻き）")
    get :index,{"item"=>"おにぎり（納豆巻き）"}
    assert_response :success 
    assert_select "div.shadow_famima div.product p.p_name" ,"納豆"
    assert_select "div.shadow_seven div.product p.p_name" ,"-"
    assert_select "div.shadow_lawson div.product p.p_name" ,"納豆"
    assert_select "span.first"
  end  
  test "パンの表示" do
    init("パン")
    get :index,{"item"=>"パン"}
    assert_response :success 
    assert_select "div.shadow_famima div.product p.p_name" ,"チョコチップスナック"
    assert_select "div.shadow_seven div.product p.p_name" ,"チョコチップスナック"
    assert_select "div.shadow_lawson div.product p.p_name" ,"チョコチップスティックパン"
    assert_select "span.first"
  end 
  test "飲むヨーグルト（プレーン）の表示" do
    init("飲むヨーグルト（プレーン）")
    get :index,{"item"=>"飲むヨーグルト（プレーン）"}
    assert_response :success 
    assert_select "div.shadow_famima div.product p.p_name" ,"プレーンヨーグルトドリンク"
    assert_select "div.shadow_seven div.product p.p_name" ,"生きて腸まで届く乳酸菌入りのむプレーンヨーグルト"
    assert_select "div.shadow_lawson div.product p.p_name" ,"生きて腸まで届くビフィズス菌ドリンクヨーグルトプレーン"
    assert_select "span.first"
  end 
  test "NotFoundの表示" do 
    get :index,{"item"=>"適当な商品"}
    assert_response :success 
    assert_select ".not_found",1 
    assert_select "span.first",0
  end 
  
 

  
end
