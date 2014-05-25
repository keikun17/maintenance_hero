class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  # GET /products
  # GET /products.json
  def index
    @products = Product.all
  end

  # GET /product/1
  # GET /product/1.json
  def show
  end

  # GET /products/new
  def new
    @product = Product.new
  end

  # GET /product/1/edit
  def edit
  end

  # POST /product
  # POST /product.json
  def create
    @product = Product.initialize_with_dynamic_properties(product_params)

    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: 'Product was successfully created.' }
        format.json { render :show, status: :created, location: @product }
      else
        binding.pry
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /product/1
  # PATCH/PUT /product/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /product/1
  # DELETE /product/1.json
  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url, notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      permitted_attributes = [:category_id, :description, :design_specs, :actual_specs, :itemcode, :installed_at, :replaced_at, :failure_mode]
      permitted_attributes.concat(Property.design_properties + Property.actual_properties)
      params.require(:product).permit(permitted_attributes)
    end
end
