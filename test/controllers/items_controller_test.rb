require 'test_helper'

class ItemsControllerTest < ActionController::TestCase
  setup do
    @item = items(:one)
  end

  test "商品がない場合" do
    get :view,{"name"=>"適当な商品","shop"=>"ファミマ"}
    assert_response :success 
    assert_select ".not_found",1 
  end

  test "ファミマの国産鶏のサラダチキン" do
    get :view,{"name"=>"国産鶏のサラダキチン","shop"=>"ファミマ"}
    assert_response :success
    assert_select "p.p_name","ファミマ  国産鶏のサラダチキン"
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:items)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create item" do
    assert_difference('Item.count') do
      post :create, item: { bad: @item.bad, category: @item.category, good: @item.good, item: @item.item, name: @item.name, price: @item.price, shop: @item.shop }
    end

    assert_redirected_to item_path(assigns(:item))
  end

  test "should show item" do
    get :show, id: @item
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @item
    assert_response :success
  end

  test "should update item" do
    patch :update, id: @item, item: { bad: @item.bad, category: @item.category, good: @item.good, item: @item.item, name: @item.name, price: @item.price, shop: @item.shop }
    assert_redirected_to item_path(assigns(:item))
  end

  test "should destroy item" do
    assert_difference('Item.count', -1) do
      delete :destroy, id: @item
    end

    assert_redirected_to items_path
  end
end
