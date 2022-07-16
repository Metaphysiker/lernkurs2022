class OpenQuestionsController < ApplicationController
  before_action :set_open_question, only: %i[ show edit update destroy ]

  # GET /open_questions or /open_questions.json
  def index
    @open_questions = OpenQuestion.all
  end

  # GET /open_questions/1 or /open_questions/1.json
  def show
  end

  # GET /open_questions/new
  def new
    @open_question = OpenQuestion.new
  end

  # GET /open_questions/1/edit
  def edit
  end

  # POST /open_questions or /open_questions.json
  def create
    @open_question = OpenQuestion.new(open_question_params)

    respond_to do |format|
      if @open_question.save
        format.html { redirect_to open_question_url(@open_question), notice: "Open question was successfully created." }
        format.json { render :show, status: :created, location: @open_question }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @open_question.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /open_questions/1 or /open_questions/1.json
  def update
    respond_to do |format|
      if @open_question.update(open_question_params)
        format.html { redirect_to open_question_url(@open_question), notice: "Open question was successfully updated." }
        format.json { render :show, status: :ok, location: @open_question }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @open_question.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /open_questions/1 or /open_questions/1.json
  def destroy
    @open_question.destroy

    respond_to do |format|
      format.html { redirect_to open_questions_url, notice: "Open question was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_open_question
      @open_question = OpenQuestion.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def open_question_params
      params.require(:open_question).permit(:slide_id, :content, :correct_answer)
    end
end
