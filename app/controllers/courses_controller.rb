class CoursesController < ApplicationController
  before_action :set_course, only: %i[ show edit update destroy course_overview show_at_slide]
  before_action :set_account

  # GET /courses or /courses.json
  def index
    @courses = Course.all
  end

  # GET /courses/1 or /courses/1.json
  def show
    if params[:slide_id].present?
      @slide = Slide.find(params[:slide_id])
    else
      @slide = @course.slides.order(:sort).first
    end

  end

  def course_overview

  end

  # GET /courses/new
  def new
    @course = Course.new
  end

  # GET /courses/1/edit
  def edit
  end

  # POST /courses or /courses.json
  def create
    @course = Course.new(course_params)

    respond_to do |format|
      if @course.save
        format.html { redirect_to course_url(@course), notice: "Course was successfully created." }
        format.json { render :show, status: :created, location: @course }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /courses/1 or /courses/1.json
  def update
    respond_to do |format|
      if @course.update(course_params)
        format.html { redirect_to course_url(@course), notice: "Course was successfully updated." }
        format.json { render :show, status: :ok, location: @course }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /courses/1 or /courses/1.json
  def destroy
    @course.destroy

    respond_to do |format|
      format.html { redirect_to courses_url, notice: "Course was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_course
      @course = Course.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def course_params
      params.require(:course).permit(:name, :course_id, :description, :image)
    end

    def set_account
      if user_signed_in?
        if current_user.account.present?
          @account = current_user.account if current_user.account.present?
        else
          @account = Account.create(user_id: current_user.id)
        end
      elsif cookies["philosophie-lernkurs-account-id"].present?
        @account = Account.find(cookies["philosophie-lernkurs-account-id"])
        if @account.user.present?
          redirect_to new_user_session_path
        end
      else
        @account = Account.create
        cookies.permanent["philosophie-lernkurs-account-id"] = @account.id
      end
    end
end
