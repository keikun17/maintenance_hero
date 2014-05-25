require 'test_helper'

class ProductsControllerTest < ActionController::TestCase
  setup do
    @product = product(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:product)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create product" do
    assert_difference('Product.count') do
      post :create, product: { actual_specs: @product.actual_specs, description: @product.description, failure_mode: @product.failure_mode, installed_at: @product.installed_at, itemcode: @product.itemcode, design_specs: @product.design_specs, replaced_at: @product.replaced_at }
    end

    assert_redirected_to product_path(assigns(:product))
  end

  test "should show product" do
    get :show, id: @product
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @product
    assert_response :success
  end

  test "should update product" do
    patch :update, id: @product, product: { actual_specs: @product.actual_specs, description: @product.description, failure_mode: @product.failure_mode, installed_at: @product.installed_at, itemcode: @product.itemcode, design_specs: @product.design_specs, replaced_at: @product.replaced_at }
    assert_redirected_to product_path(assigns(:product))
  end

  test "should destroy product" do
    assert_difference('Product.count', -1) do
      delete :destroy, id: @product
    end

    assert_redirected_to products_path
  end
end
