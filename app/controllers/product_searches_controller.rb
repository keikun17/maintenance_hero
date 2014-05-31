class ProductSearchesController < ApplicationController
  def search
  end

  def update_category_properties
    render partial: 'properties', locals: {category_id: params[:category_id]}
  end

  def results
    @search_category = params["category"]
    @search_location = params["location"]
    @search_property = params["property"]
    @search_term = params["search_term"]

    @category = Category.find(@search_category)
    @property = @category.properties.find(@search_property)

    @products = Product.where("design_specs -> :hstore_field = :value",
                               hstore_field: @property.design_key,
                               value: @search_term.to_s)


    #TODO Add Location?

  end
end
