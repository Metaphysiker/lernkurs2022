class SortingExercisesController < ApplicationController
  before_action :set_sorting_exercise, only: %i[ show edit update destroy ]
  after_action :verify_authorized

  # GET /sorting_exercises or /sorting_exercises.json
  def index
    authorize SortingExercise
    @sorting_exercises = SortingExercise.all
  end

  # GET /sorting_exercises/1 or /sorting_exercises/1.json
  def show
    authorize @sorting_exercise
  end

  # GET /sorting_exercises/new
  def new
    if params[:slide_id].present?
      @sorting_exercise = SortingExercise.new(slide_id: params[:slide_id])
    else
      @sorting_exercise = SortingExercise.new
    end
    authorize @sorting_exercise
  end

  # GET /sorting_exercises/1/edit
  def edit
    authorize @sorting_exercise
  end

  # POST /sorting_exercises or /sorting_exercises.json
  def create
    @sorting_exercise = SortingExercise.new(sorting_exercise_params)
    authorize @sorting_exercise
    respond_to do |format|
      if @sorting_exercise.save
        format.html { redirect_to sorting_exercise_url(@sorting_exercise), notice: "Sorting exercise was successfully created." }
        format.json { render :show, status: :created, location: @sorting_exercise }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @sorting_exercise.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sorting_exercises/1 or /sorting_exercises/1.json
  def update
    authorize @sorting_exercise
    respond_to do |format|
      if @sorting_exercise.update(sorting_exercise_params)
        format.html { redirect_to sorting_exercise_url(@sorting_exercise), notice: "Sorting exercise was successfully updated." }
        format.json { render :show, status: :ok, location: @sorting_exercise }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @sorting_exercise.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sorting_exercises/1 or /sorting_exercises/1.json
  def destroy
    authorize @sorting_exercise
    @sorting_exercise.destroy

    respond_to do |format|
      format.html { redirect_to sorting_exercises_url, notice: "Sorting exercise was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sorting_exercise
      @sorting_exercise = SortingExercise.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def sorting_exercise_params
      params.require(:sorting_exercise).permit(:content, :solution, :slide_id)
    end
end
