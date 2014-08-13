class FailureModesController < ApplicationController
  before_action :set_failure_mode, only: [:show, :edit, :update, :destroy]

  # GET /failure_modes
  # GET /failure_modes.json
  def index
    @failure_modes = FailureMode.all
  end

  # GET /failure_modes/1
  # GET /failure_modes/1.json
  def show
  end

  # GET /failure_modes/new
  def new
    @failure_mode = FailureMode.new
  end

  # GET /failure_modes/1/edit
  def edit
  end

  # POST /failure_modes
  # POST /failure_modes.json
  def create
    @failure_mode = FailureMode.new(failure_mode_params)

    respond_to do |format|
      if @failure_mode.save
        format.html { redirect_to @failure_mode, notice: 'Failure mode was successfully created.' }
        format.json { render :show, status: :created, location: @failure_mode }
      else
        format.html { render :new }
        format.json { render json: @failure_mode.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /failure_modes/1
  # PATCH/PUT /failure_modes/1.json
  def update
    respond_to do |format|
      if @failure_mode.update(failure_mode_params)
        format.html { redirect_to @failure_mode, notice: 'Failure mode was successfully updated.' }
        format.json { render :show, status: :ok, location: @failure_mode }
      else
        format.html { render :edit }
        format.json { render json: @failure_mode.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /failure_modes/1
  # DELETE /failure_modes/1.json
  def destroy
    @failure_mode.destroy
    respond_to do |format|
      format.html { redirect_to failure_modes_url, notice: 'Failure mode was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_failure_mode
      @failure_mode = FailureMode.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def failure_mode_params
      params.require(:failure_mode).permit(:equipment_id, :name)
    end
end
