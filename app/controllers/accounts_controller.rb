class AccountsController < ApplicationController
  before_action :set_account, only: %i[ show edit update destroy update_course_history update_excercise_history ]

  # GET /accounts or /accounts.json
  def index
    @accounts = Account.all
  end

  # GET /accounts/1 or /accounts/1.json
  def show
  end

  # GET /accounts/new
  def new
    @account = Account.new
  end

  # GET /accounts/1/edit
  def edit
  end

  # POST /accounts or /accounts.json
  def create
    @account = Account.new(account_params)

    respond_to do |format|
      if @account.save
        format.html { redirect_to account_url(@account), notice: "Account was successfully created." }
        format.json { render :show, status: :created, location: @account }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @account.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /accounts/1 or /accounts/1.json
  def update
    respond_to do |format|
      if @account.update(account_params)
        format.html { redirect_to account_url(@account), notice: "Account was successfully updated." }
        format.json { render :show, status: :ok, location: @account }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @account.errors, status: :unprocessable_entity }
      end
    end
  end

  def update_course_history
    course_id = params[:course_id]
    slide_id = params[:slide_id]

    courses = @account.courses

    if courses.key?(course_id)
      courses[course_id]["history"] = courses[course_id]["history"].push(slide_id)
    else
      courses[course_id] = {history: [slide_id]}
    end

    @account.update(courses: courses)
    head :ok
  end

  def update_excercise_history
    exercise_class = params[:exercise_class]
    exercise_id = params[:exercise_id]

    exercise = exercise_class.classify.safe_constantize.find(exercise_id)
    course = exercise.slide.course

    points = params[:points].to_i
    exercises = @account.exercises
    exercise_id_and_class = exercise_class + "-" + exercise_id.to_s

    exercise_hash = {id: exercise_id, class: exercise_class, points_scored: points}

    if exercises.key?(course.id.to_s)
      exercise_entry = exercises[course.id.to_s]["exercises"].detect { |h| h["id"] == exercise_id}

      if exercise_entry.nil?
        exercises[course.id.to_s]["exercises"] = exercises[course.id.to_s]["exercises"].push(exercise_hash)
      else
        exercises[course.id.to_s]["exercises"].map do |h|
          h["points_scored"] = points if h["id"] == exercise_id
        end
        #exercises[course.id.to_s]["exercises"] = exercises[course.id.to_s]["exercises"].push(exercise_hash)

      end

    else
      exercises[course.id.to_s] = {"exercises" => [exercise_hash]}
    end

    @account.update(exercises: exercises)
    head :ok
  end

  # DELETE /accounts/1 or /accounts/1.json
  def destroy
    @account.destroy

    respond_to do |format|
      format.html { redirect_to accounts_url, notice: "Account was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_account
      @account = Account.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def account_params
      params.require(:account).permit(:user_id, :first_name)
    end
end
