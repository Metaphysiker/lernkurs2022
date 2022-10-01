class PointSystemsController < ApplicationController
  before_action :set_point_system, only: %i[ show edit update destroy ]
  after_action :verify_authorized

  # GET /point_systems or /point_systems.json
  def index
    authorize PointSystem
    @point_systems = PointSystem.all
  end

  # GET /point_systems/1 or /point_systems/1.json
  def show
    authorize @point_system
  end

  # GET /point_systems/new
  def new
    authorize @point_system
    @point_system = PointSystem.new
  end

  # GET /point_systems/1/edit
  def edit
    authorize @point_system
  end

  # POST /point_systems or /point_systems.json
  def create
    @point_system = PointSystem.new(point_system_params)
    authorize @point_system
    respond_to do |format|
      if @point_system.save
        format.html { redirect_to point_system_url(@point_system), notice: "Point system was successfully created." }
        format.json { render :show, status: :created, location: @point_system }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @point_system.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /point_systems/1 or /point_systems/1.json
  def update
    authorize @point_system
    respond_to do |format|
      if @point_system.update(point_system_params)
        format.html { redirect_to point_system_url(@point_system), notice: "Point system was successfully updated." }
        format.json { render :show, status: :ok, location: @point_system }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @point_system.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /point_systems/1 or /point_systems/1.json
  def destroy
    authorize @point_system
    @point_system.destroy

    respond_to do |format|
      format.html { redirect_to point_systems_url, notice: "Point system was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_point_system
      @point_system = PointSystem.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def point_system_params
      params.require(:point_system).permit(:total_possible_points, :points_deduction_for_mistake, :pointsystemable_type, :pointsystemable_id)
    end
end
