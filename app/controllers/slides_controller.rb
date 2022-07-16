class SlidesController < ApplicationController
  before_action :set_slide, only: %i[ show edit update destroy navigation_buttons exercise]

  # GET /slides or /slides.json
  def index
    @slides = Slide.all
  end

  # GET /slides/1 or /slides/1.json
  def show

  end

  # GET /slides/new
  def new
    if params[:course_id].present?
      @slide = Slide.new(course_id: params[:course_id])
    else
      @slide = Slide.new
    end
  end

  # GET /slides/1/edit
  def edit
  end

  # POST /slides or /slides.json
  def create
    @slide = Slide.new(slide_params)

    respond_to do |format|
      if @slide.save
        format.html { redirect_to slide_url(@slide), notice: "Slide was successfully created." }
        format.json { render :show, status: :created, location: @slide }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @slide.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /slides/1 or /slides/1.json
  def update
    respond_to do |format|
      if @slide.update(slide_params)
        format.html { redirect_to slide_url(@slide), notice: "Slide was successfully updated." }
        format.json { render :show, status: :ok, location: @slide }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @slide.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /slides/1 or /slides/1.json
  def destroy
    @slide.destroy

    respond_to do |format|
      format.html { redirect_to slides_url, notice: "Slide was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def update_order
    params["order"].each_with_index do |id, index|
      Slide.find(id).update(sort: index)
    end
    head :ok
  end

  def navigation_buttons
    render partial: "slides/navigation_buttons", locals: {slide: @slide}, layout: false
  end

  def exercise
    if @slide.quizzes.present?
      render partial: "quizzes/quiz", locals: {quiz: @slide.quizzes.first}, layout: false
    elsif @slide.checkbox_exercises.present?
      render partial: "checkbox_exercises/checkbox_exercise", locals: {checkbox_exercise: @slide.checkbox_exercises.first}, layout: false
    elsif @slide.clozes.present?
      render partial: "clozes/cloze", locals: {cloze: @slide.clozes.first}, layout: false
    else
      render plain: ""
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_slide
      @slide = Slide.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def slide_params
      params.require(:slide).permit(:content, :course_id, :slide_id)
    end
end
