require 'test_helper'

class EquipmentFieldsControllerTest < ActionController::TestCase
  setup do
    @equipment_field = equipments_field(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:equipments_field)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create equipment_field" do
    assert_difference('EquipmentField.count') do
      post :create, equipment_field: { equipment_type_id: @equipment_field.equipment_type_id, field_type: @equipment_field.field_type, name: @equipment_field.name, position: @equipment_field.position }
    end

    assert_redirected_to equipment_field_path(assigns(:equipment_field))
  end

  test "should show equipment_field" do
    get :show, id: @equipment_field
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @equipment_field
    assert_response :success
  end

  test "should update equipment_field" do
    patch :update, id: @equipment_field, equipment_field: { equipment_type_id: @equipment_field.equipment_type_id, field_type: @equipment_field.field_type, name: @equipment_field.name, position: @equipment_field.position }
    assert_redirected_to equipment_field_path(assigns(:equipment_field))
  end

  test "should destroy equipment_field" do
    assert_difference('EquipmentField.count', -1) do
      delete :destroy, id: @equipment_field
    end

    assert_redirected_to equipments_field_path
  end
end
