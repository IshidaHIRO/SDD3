require 'test_helper'

class ItemsControllerTest < ActionController::TestCase
  setup do
    @item = items(:one)
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
      post :create, item: { calorie: @item.calorie, carbon: @item.carbon, category: @item.category, fat: @item.fat, fiber: @item.fiber, item: @item.item, name: @item.name, net: @item.net, price: @item.price, protein: @item.protein, shop: @item.shop, sodium: @item.sodium, sugar: @item.sugar }
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
    patch :update, id: @item, item: { calorie: @item.calorie, carbon: @item.carbon, category: @item.category, fat: @item.fat, fiber: @item.fiber, item: @item.item, name: @item.name, net: @item.net, price: @item.price, protein: @item.protein, shop: @item.shop, sodium: @item.sodium, sugar: @item.sugar }
    assert_redirected_to item_path(assigns(:item))
  end

  test "should destroy item" do
    assert_difference('Item.count', -1) do
      delete :destroy, id: @item
    end

    assert_redirected_to items_path
  end
end
