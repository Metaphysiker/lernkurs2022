class ClozesController < ApplicationController
  before_action :set_cloze, only: %i[ show edit update destroy ]
  after_action :verify_authorized

  # GET /clozes or /clozes.json
  def index
    authorize Cloze
    @clozes = Cloze.all
  end

  # GET /clozes/1 or /clozes/1.json
  def show
    authorize @cloze
  end

  # GET /clozes/new
  def new
    @cloze = Cloze.new
    authorize @cloze
    if params[:slide_id].present?
      @cloze = Cloze.new(slide_id: params[:slide_id])
    else
      @cloze = Cloze.new
    end
  end

  # GET /clozes/1/edit
  def edit
    authorize @cloze
  end

  # POST /clozes or /clozes.json
  def create
    @cloze = Cloze.new(cloze_params)
    authorize @cloze
    respond_to do |format|
      if @cloze.save
        format.html { redirect_to cloze_url(@cloze), notice: "Cloze was successfully created." }
        format.json { render :show, status: :created, location: @cloze }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @cloze.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /clozes/1 or /clozes/1.json
  def update
    authorize @cloze
    respond_to do |format|
      if @cloze.update(cloze_params)
        format.html { redirect_to cloze_url(@cloze), notice: "Cloze was successfully updated." }
        format.json { render :show, status: :ok, location: @cloze }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @cloze.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /clozes/1 or /clozes/1.json
  def destroy
    authorize @cloze
    @cloze.destroy

    respond_to do |format|
      format.html { redirect_to clozes_url, notice: "Cloze was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cloze
      @cloze = Cloze.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def cloze_params
      params.require(:cloze).permit(:content, :correct_answer, :slide_id, :cloze, :text)
    end
end
