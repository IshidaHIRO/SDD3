require 'test_helper'

class ItemReviewsControllerTest < ActionController::TestCase
  setup do
    @item_review = item_reviews(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:item_reviews)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create item_review" do
    assert_difference('ItemReview.count') do
      post :create, item_review: { comment: @item_review.comment, handlename: @item_review.handlename, item_id: @item_review.item_id }
    end

    assert_redirected_to item_review_path(assigns(:item_review))
  end

  test "should show item_review" do
    get :show, id: @item_review
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @item_review
    assert_response :success
  end

  test "should update item_review" do
    patch :update, id: @item_review, item_review: { comment: @item_review.comment, handlename: @item_review.handlename, item_id: @item_review.item_id }
    assert_redirected_to item_review_path(assigns(:item_review))
  end

  test "should destroy item_review" do
    assert_difference('ItemReview.count', -1) do
      delete :destroy, id: @item_review
    end

    assert_redirected_to item_reviews_path
  end
end
