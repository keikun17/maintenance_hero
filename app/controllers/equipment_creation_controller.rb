class EquipmentCreationController < ApplicationController
  include Wicked::Wizard

  steps :select_category, :encode_equipment

  def show
    @equipment = Equipment.new
    render_wizard
  end

  def update
    case step
    when :encode_equipment
      @equipment = Equipment.new(equipment_params)
      # @equipment.attributes = equipment_params
    end
    render_wizard
  end

  private

  def equipment_params
    params.require(:equipment).permit([:category_id])
  end
end
