class CheckboxExercisesController < ApplicationController
  before_action :set_checkbox_exercise, only: %i[ show edit update destroy ]
  after_action :verify_authorized

  # GET /checkbox_exercises or /checkbox_exercises.json
  def index
    authorize CheckboxExercise
    @checkbox_exercises = CheckboxExercise.all
  end

  # GET /checkbox_exercises/1 or /checkbox_exercises/1.json
  def show
    authorize @checkbox_exercise
  end

  # GET /checkbox_exercises/new
  def new
    authorize @checkbox_exercise
    if params[:slide_id].present?
      @checkbox_exercise = CheckboxExercise.new(slide_id: params[:slide_id])
    else
      @checkbox_exercise = CheckboxExercise.new
    end
  end

  # GET /checkbox_exercises/1/edit
  def edit
    authorize @checkbox_exercise
  end

  # POST /checkbox_exercises or /checkbox_exercises.json
  def create
    @checkbox_exercise = CheckboxExercise.new(checkbox_exercise_params)
    authorize @checkbox_exercise
    respond_to do |format|
      if @checkbox_exercise.save
        format.html { redirect_to checkbox_exercise_url(@checkbox_exercise), notice: "Checkbox exercise was successfully created." }
        format.json { render :show, status: :created, location: @checkbox_exercise }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @checkbox_exercise.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /checkbox_exercises/1 or /checkbox_exercises/1.json
  def update
    authorize @checkbox_exercise
    respond_to do |format|
      if @checkbox_exercise.update(checkbox_exercise_params)
        format.html { redirect_to checkbox_exercise_url(@checkbox_exercise), notice: "Checkbox exercise was successfully updated." }
        format.json { render :show, status: :ok, location: @checkbox_exercise }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @checkbox_exercise.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /checkbox_exercises/1 or /checkbox_exercises/1.json
  def destroy
    authorize @checkbox_exercise
    @checkbox_exercise.destroy

    respond_to do |format|
      format.html { redirect_to checkbox_exercises_url, notice: "Checkbox exercise was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_checkbox_exercise
      @checkbox_exercise = CheckboxExercise.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def checkbox_exercise_params
      params.require(:checkbox_exercise).permit(:content, :slide_id)
    end
end
