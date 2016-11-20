require 'test_helper'

class WelcomeControllerTest < ActionController::TestCase

  def add_item(shop,category,name,price,good,bad)
    item = Item.new
    item.shop=shop
    item.category=category
    item.item=category
    item.name=name
    item.price=price
    item.good=good
    item.bad=bad
    item.save
  end

  def setup
    items = Item.all
    items.each {|item| 
      item.destroy
    }
  end  

  
  test "Indexの表示" do
    # 惣菜のみが表示される
    self.add_item('ファミマ','惣菜','国産鶏のサラダチキン',239,0,0)
    self.add_item('セブン','惣菜','サラダチキン',198,0,0)
    self.add_item('ローソン','おにぎり','シーチキンマヨネーズ',110,0,0)
    get :index
    assert_response :success
    assert_select "a.p_name",2
  end

  test "惣菜の表示" do 
    # 惣菜のみが表示される
    add_item('ファミマ','惣菜','国産鶏のサラダチキン',239,0,0)
    add_item('セブン','惣菜','サラダチキン',198,0,0)
    add_item('ローソン','おにぎり','シーチキンマヨネーズ',110,0,0)
    get :index,{"item"=>"惣菜"}
    assert_response :success 
    assert_select "a.p_name",2
  end 

  test "おにぎりの表示" do
    # おにぎりのみが表示される
    add_item('ファミマ','惣菜','国産鶏のサラダチキン',239,0,0)
    add_item('セブン','おにぎり','紀州南高梅',198,0,0)
    add_item('ローソン','おにぎり','シーチキンマヨネーズ',110,0,0)
    get :index,{"item"=>"おにぎり"}
    assert_response :success 
    assert_select "a.p_name",2 
  end 

  test "スイーツの表示" do
    #スイーツのみ表示される
    add_item('ファミマ','スイーツ','プリン',239,0,0)
    add_item('セブン','ドリンク','ドリンク2',198,0,0)
    add_item('ローソン','スイーツ','チョコチップスナック',110,0,0)
    get :index,{"item"=>"スイーツ"}
    assert_response :success 
    assert_select "a.p_name",2 
  end 

  test "飲むヨーグルト（プレーン）の表示" do 
    #ドリンクのみ表示される
    add_item('ファミマ','ドリンク','ドリンク1',239,0,0)
    add_item('セブン','ドリンク','ドリンク2',198,0,0)
    add_item('ローソン','おにぎり','シーチキンマヨネーズ',110,0,0)
    get :index,{"item"=>"ドリンク"}
    assert_response :success 
    assert_select "a.p_name",2 
  end 

  test "NotFoundの表示" do 
    #なにも表示されない
    add_item('ファミマ','惣菜','国産鶏のサラダチキン',239,0,0)
    add_item('セブン','惣菜','サラダチキン',198,0,0)
    add_item('ローソン','おにぎり','シーチキンマヨネーズ',110,0,0)
    get :index,{"item"=>"適当な商品"}
    assert_response :success 
    assert_select ".not_found",1 
  end
    
  test "商品表示順の確認" do
    #惣菜のみが表示される
    #惣菜2、惣菜3、惣菜1の順に表示される
    add_item('ファミマ','惣菜','惣菜1',239,5,4)
    add_item('セブン','惣菜','惣菜2',198,0,20)
    add_item('ローソン','惣菜','惣菜3',110,10,0)  
    get :index,{"item"=>"惣菜"}
    assert_response :success 
    assert_select ".rank1 .p_name","惣菜2"
    assert_select ".rank2 .p_name","惣菜3"
    assert_select ".rank3 .p_name","惣菜1"
  end
  
  test "商品表示順の確認(同点時)" do
    add_item('ファミマ','惣菜','惣菜1',239,5,4)
    add_item('セブン','惣菜','惣菜2',198,0,20)
    add_item('ローソン','惣菜','惣菜3',110,20,0)  
    get :index,{"item"=>"惣菜"}
    assert_response :success 
    assert_select ".rank1 .p_name",2
    assert_select ".rank2 .p_name",0
    assert_select ".rank3 .p_name",1
  end
  
  test "商品表示順の確認(全て同点時)" do
    add_item('ファミマ','惣菜','惣菜1',239,0,0)
    add_item('セブン','惣菜','惣菜2',198,0,0)
    add_item('ローソン','惣菜','惣菜3',110,0,0)  
    get :index,{"item"=>"惣菜"}
    assert_response :success 
    assert_select ".rank1 .p_name",3
    assert_select ".rank2 .p_name",0
    assert_select ".rank3 .p_name",0
  end
end
