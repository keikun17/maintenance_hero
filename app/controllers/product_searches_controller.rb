class ProductSearchesController < ApplicationController
  def search
  end

  def update_equipment_properties
    render partial: 'properties', locals: {equipment_id: params[:equipment_id]}
  end

  def results
    @search_equipment = params["search"]["equipment"]
    @search_property = params["search"]["property"]
    @search_term = params["search_term"]

    @equipment = Equipment.find(@search_equipment)
    @property = @equipment.properties.find(@search_property)

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
