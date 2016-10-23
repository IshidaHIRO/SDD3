require 'test_helper'

class WelcomeControllerTest < ActionController::TestCase
  test "Indexの表示" do
    get :index
    assert_response :success
  end
  test "サラダキチンの表示" do
    get(:index,'サラダキチン')
    assert_response :success 
  end 
  test "サラダの表示" do
    get(:index,'サラダ')
    assert_response :success 
  end 
  test "スープの表示" do
    get(:index,'スープ')
    assert_response :success 
  end 
  test "おにぎり（梅）の表示" do
    get(:index,'おにぎり（梅）')
    assert_response :success 
  end 
  test "おにぎり（ツナ）の表示" do
    get(:index,'おにぎり（ツナ）')
    assert_response :success 
  end 
  test "おにぎり（昆布）の表示" do
    get(:index,'おにぎり（昆布）')
    assert_response :success 
  end 
  test "おにぎり（納豆巻き）の表示" do
    get(:index,'おにぎり（納豆巻き）')
    assert_response :success 
  end  
  test "パンの表示" do
    get(:index,'パン')
    assert_response :success 
  end 
  test "飲むヨーグルト（プレーン）の表示" do
    get(:index,'飲むヨーグルト（プレーン）')
    assert_response :success 
  end 
  test "NotFoundの表示" do
    get(:index,'適当な商品')
    assert_response :success
    #assert_select ".not_found",1 
  end 
  
 

  
end
