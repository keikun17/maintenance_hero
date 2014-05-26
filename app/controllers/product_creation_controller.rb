class ProductCreationController < ApplicationController
  include Wicked::Wizard

  steps :select_category, :encode_product

  def show
    @product = Product.new
    render_wizard
  end

  def update
    case step
    when :encode_product
      @product = Product.new(product_params)
    end
    render_wizard
  end

  private

  def product_params
    params.require(:product).permit([:category_id])
  end
end