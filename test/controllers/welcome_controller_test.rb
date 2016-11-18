require 'test_helper'

class WelcomeControllerTest < ActionController::TestCase
  
  test "Indexの表示" do
    get :index
    assert_response :success
    assert_select "div#accordion1 a.p_name" ,"ファミマ  国産鶏のサラダチキン" 
  end
  test "惣菜の表示" do 
    get :index,{"item"=>"惣菜"}
    assert_response :success 
    assert_select "div#accordion1 a.p_name" ,"ファミマ  国産鶏のサラダチキン" 
  end 
  test "おにぎりの表示" do
    get :index,{"item"=>"おにぎり"}
    assert_response :success 
    assert_select "div#accordion13 a.p_name" ,"ファミマ  紀州南高梅" 
  end 
  test "スイーツの表示" do
    get :index,{"item"=>"スイーツ"}
    assert_response :success 
    assert_select "div#accordion27 a.p_name" ,"ファミマ  チョコチップスナック" 
  end 
  test "飲むヨーグルト（プレーン）の表示" do 
    get :index,{"item"=>"ドリンク"}
    assert_response :success 
    assert_select "div#accordion30 a.p_name" ,"ファミマ  プレーンヨーグルトドリンク"
  end 
  test "NotFoundの表示" do 
    get :index,{"item"=>"適当な商品"}
    assert_response :success 
    assert_select ".not_found",1 

  end 
  
 

  
end
