class CostBenefitAnalysesController < ApplicationController
  before_action :set_cost_benefit_analysis, only: %i[ show edit update destroy ]
  after_action :verify_authorized

  # GET /cost_benefit_analyses or /cost_benefit_analyses.json
  def index
    authorize CostBenefitAnalysis
    @cost_benefit_analyses = CostBenefitAnalysis.all
  end

  # GET /cost_benefit_analyses/1 or /cost_benefit_analyses/1.json
  def show
    authorize @cost_benefit_analysis
  end

  # GET /cost_benefit_analyses/new
  def new
    if params[:slide_id].present?
      @cost_benefit_analysis = CostBenefitAnalysis.new(slide_id: params[:slide_id])
    else
      @cost_benefit_analysis = CostBenefitAnalysis.new
    end
    authorize @cost_benefit_analysis
  end

  # GET /cost_benefit_analyses/1/edit
  def edit
    authorize @cost_benefit_analysis
  end

  # POST /cost_benefit_analyses or /cost_benefit_analyses.json
  def create
    @cost_benefit_analysis = CostBenefitAnalysis.new(cost_benefit_analysis_params)
    authorize @cost_benefit_analysis
    respond_to do |format|
      if @cost_benefit_analysis.save
        format.html { redirect_to cost_benefit_analysis_url(@cost_benefit_analysis), notice: "Cost benefit analysis was successfully created." }
        format.json { render :show, status: :created, location: @cost_benefit_analysis }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @cost_benefit_analysis.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cost_benefit_analyses/1 or /cost_benefit_analyses/1.json
  def update
    authorize @cost_benefit_analysis
    respond_to do |format|
      if @cost_benefit_analysis.update(cost_benefit_analysis_params)
        format.html { redirect_to cost_benefit_analysis_url(@cost_benefit_analysis), notice: "Cost benefit analysis was successfully updated." }
        format.json { render :show, status: :ok, location: @cost_benefit_analysis }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @cost_benefit_analysis.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cost_benefit_analyses/1 or /cost_benefit_analyses/1.json
  def destroy
    authorize @cost_benefit_analysis
    @cost_benefit_analysis.destroy

    respond_to do |format|
      format.html { redirect_to cost_benefit_analyses_url, notice: "Cost benefit analysis was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cost_benefit_analysis
      @cost_benefit_analysis = CostBenefitAnalysis.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def cost_benefit_analysis_params
      params.require(:cost_benefit_analysis).permit(:slide_id, :content, :cost, :benefit)
    end
end
