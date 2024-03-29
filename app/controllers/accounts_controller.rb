class AccountsController < ApplicationController
  before_action :set_account, only: %i[ show edit update destroy update_course_history update_excercise_history update_course_status get_points_from_course save_progress check_if_medal_is_awarded users_sign_up]
  after_action :verify_authorized
  # GET /accounts or /accounts.json
  def index
    authorize Account
    @accounts = Account.all
  end

  # GET /accounts/1 or /accounts/1.json
  def show
    authorize @account
  end

  # GET /accounts/new
  def new
    @account = Account.new
    authorize @account
  end

  # GET /accounts/1/edit
  def edit
    authorize @account
  end

  # POST /accounts or /accounts.json
  def create
    @account = Account.new(account_params)
    authorize @account
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
    authorize @account
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

  def update_course_status
    authorize @account
    course_id = params[:course_id]
    slide_id = params[:slide_id]
    status = params[:status]

    courses = @account.courses

    if courses.key?(course_id)
      courses[course_id]["status"] = status
    else
      courses[course_id] = {status: status}
    end

    if status == Account.course_status_completed
      courses[course_id]["completion_date"] = Date.today.to_s
    end

    @account.update(courses: courses)
    head :ok
  end

  def update_course_history
    authorize @account
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
    authorize @account
    exercise_class = params[:exercise_class]
    exercise_id = params[:exercise_id]

    exercise = exercise_class.classify.safe_constantize.find(exercise_id)
    course = exercise.slide.course

    points = params[:points].to_i
    answer = params[:answer]
    exercises = @account.exercises
    exercise_id_and_class = exercise_class + "-" + exercise_id.to_s

    exercise_hash = {id: exercise_id, class: exercise_class, points_scored: points, answer: answer}

    if exercises.key?(course.id.to_s)
      exercise_entry = exercises[course.id.to_s]["exercises"].detect { |h| (h["id"] == exercise_id) && (h["class"] == exercise_class) }

      if exercise_entry.nil?
        exercises[course.id.to_s]["exercises"] = exercises[course.id.to_s]["exercises"].push(exercise_hash)
      else
        exercises[course.id.to_s]["exercises"].map do |h|
          if (h["id"] == exercise_id) && (h["class"] == exercise_class)
            h["points_scored"] = points
            h["answer"] = answer
          end
        end
        #exercises[course.id.to_s]["exercises"] = exercises[course.id.to_s]["exercises"].push(exercise_hash)

      end

    else
      exercises[course.id.to_s] = {"exercises" => [exercise_hash]}
    end

    @account.update(exercises: exercises)
    head :ok
  end

  def get_points_from_course
    authorize @account
    points = @account.course_points(params[:course_id])
    render json: points
  end

  def check_if_medal_is_awarded
    authorize @account
    render json: @account.check_if_medal_is_awarded(params[:course_id])
  end

  # DELETE /accounts/1 or /accounts/1.json
  def destroy
    authorize @account
    @account.destroy

    if @account.user.present?
      @account.user.destroy
    end

    @account = Account.create
    cookies.permanent["philosophie-lernkurs-account-id"] = @account.id

    respond_to do |format|
      format.html { redirect_to root_url, notice: "Konto wurde gelöscht." }
      format.json { head :no_content }
    end
  end

  #def send_results_to
  #  authorize Account
  #  CourseCompletionMailer.send_results_to_email(params[:account_id], params[:course_id], params[:email1], params[:email2]).deliver_later
  #  head :ok
  #end

  def users_sign_up
    authorize Account
      random_hex = SecureRandom.hex
      @user = User.new(email: params[:email], password: random_hex, password_confirmation: random_hex)
      if @user.save
        @account.update(user_id: @user.id, first_name: params[:first_name])
        sign_in @user
        CourseMailer.welcome_mail(params[:email], @account).deliver_later
        render json: {status: "success"}
      else
        render json: {status: "error"}.merge(@user.errors)
      end

    #render json: "success"
  end

  def save_progress
    authorize @account
    @account.update(first_name: params[:first_name]) unless params[:first_name].blank?


    if user_signed_in?

    else

      @user = User.new(email: params[:email], password: params[:password], password_confirmation: params[:params_confirmation])

      #new_user = User.create(email: params[:email], password: params[:password], password_confirmation: params[:password])
      if @user.save
        @account.update(user_id: @user.id)
        sign_in @user
        CourseMailer.welcome_mail(params[:email], @account).deliver_later
        render json: @user
      else
        render json: @user.errors
      end

    end

  end

  def dashboard
    authorize Account
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
