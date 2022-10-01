class CheckboxesController < ApplicationController
  before_action :set_checkbox, only: %i[ show edit update destroy ]
  after_action :verify_authorized

  # GET /checkboxes or /checkboxes.json
  def index
    authorize Checkbox
    @checkboxes = Checkbox.all
  end

  # GET /checkboxes/1 or /checkboxes/1.json
  def show
    authorize @checkbox
  end

  # GET /checkboxes/new
  def new
    @checkbox = Checkbox.new
    authorize @checkbox
    if params[:checkbox_exercise_id].present?
      @checkbox = Checkbox.new(checkbox_exercise_id: params[:checkbox_exercise_id])
    else
      @checkbox = Checkbox.new
    end
  end

  # GET /checkboxes/1/edit
  def edit
    authorize @checkbox
  end

  # POST /checkboxes or /checkboxes.json
  def create
    @checkbox = Checkbox.new(checkbox_params)
    authorize @checkbox
    respond_to do |format|
      if @checkbox.save
        format.html { redirect_to checkbox_url(@checkbox), notice: "Checkbox was successfully created." }
        format.json { render :show, status: :created, location: @checkbox }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @checkbox.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /checkboxes/1 or /checkboxes/1.json
  def update
    authorize @checkbox
    respond_to do |format|
      if @checkbox.update(checkbox_params)
        format.html { redirect_to checkbox_url(@checkbox), notice: "Checkbox was successfully updated." }
        format.json { render :show, status: :ok, location: @checkbox }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @checkbox.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /checkboxes/1 or /checkboxes/1.json
  def destroy
    authorize @checkbox
    @checkbox.destroy

    respond_to do |format|
      format.html { redirect_to checkboxes_url, notice: "Checkbox was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_checkbox
      @checkbox = Checkbox.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def checkbox_params
      params.require(:checkbox).permit(:content, :checkbox_exercise_id, :correct_answer)
    end
end
