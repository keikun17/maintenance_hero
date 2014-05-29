require 'test_helper'

class FailureModesControllerTest < ActionController::TestCase
  setup do
    @failure_mode = failure_modes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:failure_modes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create failure_mode" do
    assert_difference('FailureMode.count') do
      post :create, failure_mode: { category_id: @failure_mode.category_id, name: @failure_mode.name }
    end

    assert_redirected_to failure_mode_path(assigns(:failure_mode))
  end

  test "should show failure_mode" do
    get :show, id: @failure_mode
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @failure_mode
    assert_response :success
  end

  test "should update failure_mode" do
    patch :update, id: @failure_mode, failure_mode: { category_id: @failure_mode.category_id, name: @failure_mode.name }
    assert_redirected_to failure_mode_path(assigns(:failure_mode))
  end

  test "should destroy failure_mode" do
    assert_difference('FailureMode.count', -1) do
      delete :destroy, id: @failure_mode
    end

    assert_redirected_to failure_modes_path
  end
end
