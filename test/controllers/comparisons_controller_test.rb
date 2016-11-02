require 'test_helper'

class ComparisonsControllerTest < ActionController::TestCase
  setup do
    @comparison = comparisons(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:comparisons)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create comparison" do
    assert_difference('Comparison.count') do
      post :create, comparison: { comment: @comparison.comment, comparison: @comparison.comparison, item_id: @comparison.item_id, point: @comparison.point, point_type: @comparison.point_type, user: @comparison.user }
    end

    assert_redirected_to comparison_path(assigns(:comparison))
  end

  test "should show comparison" do
    get :show, id: @comparison
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @comparison
    assert_response :success
  end

  test "should update comparison" do
    patch :update, id: @comparison, comparison: { comment: @comparison.comment, comparison: @comparison.comparison, item_id: @comparison.item_id, point: @comparison.point, point_type: @comparison.point_type, user: @comparison.user }
    assert_redirected_to comparison_path(assigns(:comparison))
  end

  test "should destroy comparison" do
    assert_difference('Comparison.count', -1) do
      delete :destroy, id: @comparison
    end

    assert_redirected_to comparisons_path
  end
end
