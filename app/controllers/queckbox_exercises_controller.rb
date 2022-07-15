class QueckboxExercisesController < ApplicationController
  before_action :set_queckbox_exercise, only: %i[ show edit update destroy ]

  # GET /queckbox_exercises or /queckbox_exercises.json
  def index
    @queckbox_exercises = QueckboxExercise.all
  end

  # GET /queckbox_exercises/1 or /queckbox_exercises/1.json
  def show
  end

  # GET /queckbox_exercises/new
  def new
    @queckbox_exercise = QueckboxExercise.new
  end

  # GET /queckbox_exercises/1/edit
  def edit
  end

  # POST /queckbox_exercises or /queckbox_exercises.json
  def create
    @queckbox_exercise = QueckboxExercise.new(queckbox_exercise_params)

    respond_to do |format|
      if @queckbox_exercise.save
        format.html { redirect_to queckbox_exercise_url(@queckbox_exercise), notice: "Queckbox exercise was successfully created." }
        format.json { render :show, status: :created, location: @queckbox_exercise }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @queckbox_exercise.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /queckbox_exercises/1 or /queckbox_exercises/1.json
  def update
    respond_to do |format|
      if @queckbox_exercise.update(queckbox_exercise_params)
        format.html { redirect_to queckbox_exercise_url(@queckbox_exercise), notice: "Queckbox exercise was successfully updated." }
        format.json { render :show, status: :ok, location: @queckbox_exercise }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @queckbox_exercise.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /queckbox_exercises/1 or /queckbox_exercises/1.json
  def destroy
    @queckbox_exercise.destroy

    respond_to do |format|
      format.html { redirect_to queckbox_exercises_url, notice: "Queckbox exercise was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_queckbox_exercise
      @queckbox_exercise = QueckboxExercise.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def queckbox_exercise_params
      params.require(:queckbox_exercise).permit(:content)
    end
end
