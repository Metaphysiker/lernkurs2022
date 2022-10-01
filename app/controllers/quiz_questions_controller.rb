class QuizQuestionsController < ApplicationController
  before_action :set_quiz_question, only: %i[ show edit update destroy ]
  after_action :verify_authorized

  # GET /quiz_questions or /quiz_questions.json
  def index
    authorize QuizQuestion
    @quiz_questions = QuizQuestion.all
  end

  # GET /quiz_questions/1 or /quiz_questions/1.json
  def show
    authorize @quiz_question
  end

  # GET /quiz_questions/new
  def new
    authorize @quiz_question
    if params[:quiz_id].present?
      @quiz_question = QuizQuestion.new(quiz_id: params[:quiz_id])
    else
      @quiz_question = QuizQuestion.new
    end
  end

  # GET /quiz_questions/1/edit
  def edit
    authorize @quiz_question
  end

  # POST /quiz_questions or /quiz_questions.json
  def create
    @quiz_question = QuizQuestion.new(quiz_question_params)
    authorize @quiz_question
    respond_to do |format|
      if @quiz_question.save
        format.html { redirect_to quiz_question_url(@quiz_question), notice: "Quiz question was successfully created." }
        format.json { render :show, status: :created, location: @quiz_question }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @quiz_question.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /quiz_questions/1 or /quiz_questions/1.json
  def update
    authorize @quiz_question
    respond_to do |format|
      if @quiz_question.update(quiz_question_params)
        format.html { redirect_to quiz_question_url(@quiz_question), notice: "Quiz question was successfully updated." }
        format.json { render :show, status: :ok, location: @quiz_question }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @quiz_question.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /quiz_questions/1 or /quiz_questions/1.json
  def destroy
    authorize @quiz_question
    @quiz_question.destroy

    respond_to do |format|
      format.html { redirect_to quiz_questions_url, notice: "Quiz question was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_quiz_question
      @quiz_question = QuizQuestion.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def quiz_question_params
      params.require(:quiz_question).permit(:content, :correct_answer, :quiz_id)
    end
end
