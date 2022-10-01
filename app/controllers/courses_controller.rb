class CoursesController < ApplicationController
  before_action :set_course, only: %i[ show show_with_swipe edit update destroy course_overview show_at_slide]

  # GET /courses or /courses.json
  def index
    authorize Course
    @courses = Course.all
  end

  # GET /courses/1 or /courses/1.json
  def show
    authorize @course
    #if params[:slide_id].present? && !Slide.where(id: params[:slide_id]).empty?
    #  @slide = Slide.find(params[:slide_id])
    #else
    #  @slide = @course.slides.order(:sort).first
    #end

    if params[:sort].present? && !Slide.where(sort: params[:sort]).empty?
      @slide = Slide.where(sort: params[:sort]).first
    else
      @slide = @course.slides.order(:sort).first
    end

  end

  def show_with_swipe
    authorize @course
    if params[:slide_id].present? && !Slide.where(id: params[:slide_id]).empty?
      @slide = Slide.find(params[:slide_id])
    else
      @slide = @course.slides.order(:sort).first
    end

  end

  def course_overview
    authorize Course
  end

  # GET /courses/new
  def new
    @course = Course.new
    authorize @course
  end

  # GET /courses/1/edit
  def edit
    authorize @course
  end

  # POST /courses or /courses.json
  def create
    @course = Course.new(course_params)
    authorize @course
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
    authorize @course
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
    authorize @course
    @course.destroy

    respond_to do |format|
      format.html { redirect_to courses_url, notice: "Course was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_course
      @course = Course.friendly.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def course_params
      params.require(:course).permit(:name, :course_id, :description, :image, :medal_image, :group, :slug, :sort)
    end

end
