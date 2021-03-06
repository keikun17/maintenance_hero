class EquipmentsController < ApplicationController
  before_action :set_equipment, only: [:show, :edit, :update, :destroy]

  # GET /equipments
  # GET /equipments.json
  def index
    @equipments = Equipment.all
    @equipment_types = EquipmentType.all
  end

  # GET /equipments/1
  # GET /equipments/1.json
  def show
  end

  # GET /equipments/new
  def new
    @equipment = Equipment.new(equipment_type_id: params[:equipment_type_id])
    @systems = System.all
  end

  # GET /equipments/1/edit
  def edit
    @systems = System.all
  end

  # POST /equipments
  # POST /equipments.json
  def create
    @equipment = Equipment.new(equipment_params)

    respond_to do |format|
      if @equipment.save
        format.html { redirect_to @equipment, notice: 'Equipment was successfully created.' }
        format.json { render :show, status: :created, location: @equipment }
      else
        format.html { render :new }
        format.json { render json: @equipment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /equipments/1
  # PATCH/PUT /equipments/1.json
  def update
    respond_to do |format|
      if @equipment.update(equipment_params)
        format.html { redirect_to @equipment, notice: 'Equipment was successfully updated.' }
        format.json { render :show, status: :ok, location: @equipment }
      else
        format.html { render :edit }
        format.json { render json: @equipment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /equipments/1
  # DELETE /equipments/1.json
  def destroy
    @equipment.destroy
    respond_to do |format|
      format.html { redirect_to equipments_url, notice: 'Equipment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_equipment
      @equipment = Equipment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def equipment_params
      params.require(:equipment).
        permit( :name, :system_id,
               { specifications: equipment_field_params(equipment_type_id: params[:equipment][:equipment_type_id]) },
               :equipment_type_id)
    end

    def equipment_field_params(conditions)
      equipment_type_id = conditions[:equipment_type_id]
      EquipmentField.where(equipment_type_id: equipment_type_id).pluck(:id).collect{|id| id.to_s.to_sym }
    end

end
