class ProductSearchesController < ApplicationController
  def search
  end

  def update_category_properties
    render partial: 'properties', locals: {category_id: params[:category_id]}
  end

  def results
    @search_category = params["search"]["category"]
    @search_property = params["search"]["property"]
    @search_term = params["search_term"]

    @category = Category.find(@search_category)
    @property = @category.properties.find(@search_property)

    case params["search_specs"]
    when 'Actual'
      @search_specs = 'actual_specs'
      @hstore_field = @property.actual_key
    when 'Design'
      @search_specs = 'design_specs'
      @hstore_field = @property.design_key
    end

    @products = Product.where("#{@search_specs} -> :hstore_field = :value",
                               hstore_field: @hstore_field,
                               value: @search_term.to_s)


    #TODO Add Location?

  end
end
