require 'test_helper'

class EquipmentControllerTest < ActionController::TestCase
  setup do
    @equipment = equipment(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:equipment)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create equipment" do
    assert_difference('Equipment.count') do
      post :create, equipment: { actual_specs: @equipment.actual_specs, description: @equipment.description, failure_mode: @equipment.failure_mode, installed_at: @equipment.installed_at, itemcode: @equipment.itemcode, listed_specs: @equipment.listed_specs, replaced_at: @equipment.replaced_at }
    end

    assert_redirected_to equipment_path(assigns(:equipment))
  end

  test "should show equipment" do
    get :show, id: @equipment
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @equipment
    assert_response :success
  end

  test "should update equipment" do
    patch :update, id: @equipment, equipment: { actual_specs: @equipment.actual_specs, description: @equipment.description, failure_mode: @equipment.failure_mode, installed_at: @equipment.installed_at, itemcode: @equipment.itemcode, listed_specs: @equipment.listed_specs, replaced_at: @equipment.replaced_at }
    assert_redirected_to equipment_path(assigns(:equipment))
  end

  test "should destroy equipment" do
    assert_difference('Equipment.count', -1) do
      delete :destroy, id: @equipment
    end

    assert_redirected_to equipment_index_path
  end
end
