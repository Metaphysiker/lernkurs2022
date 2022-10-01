class MediaController < ApplicationController
  before_action :set_medium, only: %i[ show edit update destroy ]
  after_action :verify_authorized

  # GET /media or /media.json
  def index
    authorize Medium
    @media = Medium.all
  end

  # GET /media/1 or /media/1.json
  def show
    authorize @medium
  end

  # GET /media/new
  def new
    @medium = Medium.new
    authorize @medium
  end

  # GET /media/1/edit
  def edit
    authorize @medium
  end

  # POST /media or /media.json
  def create
    @medium = Medium.new(medium_params)
    authorize @medium
    respond_to do |format|
      if @medium.save
        format.html { redirect_to medium_url(@medium), notice: "Medium was successfully created." }
        format.json { render :show, status: :created, location: @medium }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @medium.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /media/1 or /media/1.json
  def update
    authorize @medium
    respond_to do |format|
      if @medium.update(medium_params)
        format.html { redirect_to medium_url(@medium), notice: "Medium was successfully updated." }
        format.json { render :show, status: :ok, location: @medium }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @medium.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /media/1 or /media/1.json
  def destroy
    authorize @medium
    @medium.destroy

    respond_to do |format|
      format.html { redirect_to media_url, notice: "Medium was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_medium
      @medium = Medium.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def medium_params
      params.require(:medium).permit(:name, :alt_text, :file)
    end
end
