class EquipmentFieldsController < ApplicationController
  before_action :set_equipment_field, only: [:show, :edit, :update, :destroy]
  
  # GET /equipment_fields
  # GET /equipment_fields.json
  def index
    @equipment_fields = EquipmentField.all
  end

  # GET /equipment_fields/1
  # GET /equipment_fields/1.json
  def show
  end

  # GET /equipment_fields/new
  def new
    @equipment_field = EquipmentField.new
  end

  # GET /equipment_fields/1/edit
  def edit
  end

  # POST /equipment_fields
  # POST /equipment_fields.json
  def create
    @equipment_field = EquipmentField.new(equipment_field_params)

    respond_to do |format|
      if @equipment_field.save
        format.html { redirect_to @equipment_field, notice: 'Equipment field was successfully created.' }
        format.json { render :show, status: :created, location: @equipment_field }
      else
        format.html { render :new }
        format.json { render json: @equipment_field.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /equipment_fields/1
  # PATCH/PUT /equipment_fields/1.json
  def update
    respond_to do |format|
      if @equipment_field.update(equipment_field_params)
        format.html { redirect_to @equipment_field, notice: 'Equipment field was successfully updated.' }
        format.json { render :show, status: :ok, location: @equipment_field }
      else
        format.html { render :edit }
        format.json { render json: @equipment_field.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /equipment_fields/1
  # DELETE /equipment_fields/1.json
  def destroy
    @equipment_field.destroy
    respond_to do |format|
      format.html { redirect_to equipment_fields_url, notice: 'Equipment field was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_equipment_field
      @equipment_field = EquipmentField.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def equipment_field_params
      params.require(:equipment_field).permit(:name, :field_type, :equipment_type_id, :position)
    end
end
