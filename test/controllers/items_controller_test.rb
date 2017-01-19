require 'test_helper'

class ItemsControllerTest < ActionController::TestCase
  setup do
    @item = items(:one)
  end

  test "良いの投稿" do
    item=Item.new
    item.good=0
    item.bad=0
    item.save
    post :vote,item:{id:item.id,good:true}    
    assert_redirected_to item
    item= Item.find(item.id)
    assert_equal(1,item.good)
    assert_equal(0,item.bad)
  end

  test "悪いの投稿" do
    item=Item.new
    item.good=0
    item.bad=0
    item.save
    post :vote,item:{id:item.id,bad:true}    
    assert_redirected_to item
    item= Item.find(item.id)
    assert_equal(0,item.good)
    assert_equal(1,item.bad)
  end
  
  test "口コミの表示" do
    item=Item.new
    item.shop="ファミマ"
    item.category="惣菜"
    item.item="惣菜"
    item.name="商品名"
    item.price=100
    item.good=10
    item.bad=3
    item.save
    item_review=ItemReview.new
    item_review.item_id=item.id
    item_review.handlename="ハンドルネーム"
    item_review.comment="コメント"
    item_review.save
    get :show, id: item
    assert_response :success
    assert_select ".item_review"
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:items)
  end

  test "should get new" do
    get :new
    assert_response :success
    assert_select "#item_shop"
    assert_select "#item_category"
    assert_select "#item_name"
    assert_select "#item_price"
    assert_select "#item_item", 0
    assert_select "#item_bad", 0
    assert_select "#item_good", 0
    assert_select "#item_image", 0
  end

  test "should create item" do
    assert_difference('Item.count') do
      post :create, item: { category: "惣菜", name: "惣菜1", price: 100, shop: "ファミマ" }
    end
    item = assigns(:item)
    assert_redirected_to item_path(item)
    assert_equal item.shop, "ファミマ"
    assert_equal item.category, "惣菜"
    assert_equal item.name, "惣菜1"
    assert_equal item.price, 100
    assert_equal item.status, "申請中"
    assert_equal item.item, "惣菜"
    assert_equal item.image, ""
    assert_equal item.good, 0
    assert_equal item.bad, 0
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
    patch :update, id: @item, item: { bad: @item.bad, category: @item.category, good: @item.good, image: @item.image, item: @item.item, name: @item.name, price: @item.price, shop: @item.shop }
    assert_redirected_to item_path(assigns(:item))
  end

  test "should destroy item" do
    assert_difference('Item.count', -1) do
      delete :destroy, id: @item
    end

    assert_redirected_to items_path
  end
end
