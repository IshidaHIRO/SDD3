require 'test_helper'

class WelcomeControllerTest < ActionController::TestCase

  def setup
    items = Item.all
    items.each {|item| 
      item.destroy
    }
    item_list =[]
    item_list.push Product_dto.new(1,"ファミマ","惣菜","国産鶏のサラダチキン",239)
    item_list.push Product_dto.new(14,"セブン","おにぎり","紀州南高梅",110)
    item_list.push Product_dto.new(29,"ローソン","スイーツ","チョコチップスティックパン",100)
    item_list.push Product_dto.new(30,"ファミマ","ドリンク","プレーンヨーグルトドリンク",nil)
   
    item_list.each{|product| 
      item = Item.new
      item.shop=product.shop
      item.name=product.name
      item.category=product.category
      item.price=product.price
      item.item=product.item
      item.save 
    }
  end  

  
  test "Indexの表示" do
    get :index
    assert_response :success
    assert_select "a.p_name" 
  end
  test "惣菜の表示" do 
    get :index,{"item"=>"惣菜"}
    assert_response :success
    assert_select "a.p_name"  
  end 
  test "おにぎりの表示" do
    get :index,{"item"=>"おにぎり"}
    assert_response :success 
    assert_select "a.p_name" 
  end 
  test "スイーツの表示" do
    get :index,{"item"=>"スイーツ"}
    assert_response :success 
    assert_select "a.p_name" 
  end 
  test "飲むヨーグルト（プレーン）の表示" do 
    get :index,{"item"=>"ドリンク"}
    assert_response :success 
    assert_select "a.p_name" 
  end 
  test "NotFoundの表示" do 
    get :index,{"item"=>"適当な商品"}
    assert_response :success 
    assert_select ".not_found",1 

  end 
  
 

  
end
