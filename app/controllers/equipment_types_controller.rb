class EquipmentTypesController < ApplicationController
  before_action :set_equipment_type, only: [:show, :edit, :update, :destroy]

  # GET /equipments_type
  # GET /equipments_type.json
  def index
    @equipments_type = EquipmentType.all
  end

  # GET /equipments_type/1
  # GET /equipments_type/1.json
  def show
  end

  # GET /equipments_type/new
  def new
    @equipment_type = EquipmentType.new
  end

  # GET /equipments_type/1/edit
  def edit
  end

  # POST /equipments_type
  # POST /equipments_type.json
  def create
    @equipment_type = EquipmentType.new(equipment_type_params)

    respond_to do |format|
      if @equipment_type.save
        format.html { redirect_to @equipment_type, notice: 'Equipment type was successfully created.' }
        format.json { render :show, status: :created, location: @equipment_type }
      else
        format.html { render :new }
        format.json { render json: @equipment_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /equipments_type/1
  # PATCH/PUT /equipments_type/1.json
  def update
    respond_to do |format|
      if @equipment_type.update(equipment_type_params)
        format.html { redirect_to @equipment_type, notice: 'Equipment type was successfully updated.' }
        format.json { render :show, status: :ok, location: @equipment_type }
      else
        format.html { render :edit }
        format.json { render json: @equipment_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /equipments_type/1
  # DELETE /equipments_type/1.json
  def destroy
    @equipment_type.destroy
    respond_to do |format|
      format.html { redirect_to equipments_type_url, notice: 'Equipment type was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_equipment_type
      @equipment_type = EquipmentType.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def equipment_type_params
      params.require(:equipment_type).permit(:name)
    end
end
