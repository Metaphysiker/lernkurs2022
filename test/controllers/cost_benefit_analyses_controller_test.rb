require "test_helper"

class CostBenefitAnalysesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @cost_benefit_analysis = cost_benefit_analyses(:one)
  end

  test "should get index" do
    get cost_benefit_analyses_url
    assert_response :success
  end

  test "should get new" do
    get new_cost_benefit_analysis_url
    assert_response :success
  end

  test "should create cost_benefit_analysis" do
    assert_difference("CostBenefitAnalysis.count") do
      post cost_benefit_analyses_url, params: { cost_benefit_analysis: { benefit: @cost_benefit_analysis.benefit, content: @cost_benefit_analysis.content, cost: @cost_benefit_analysis.cost, slide_id: @cost_benefit_analysis.slide_id } }
    end

    assert_redirected_to cost_benefit_analysis_url(CostBenefitAnalysis.last)
  end

  test "should show cost_benefit_analysis" do
    get cost_benefit_analysis_url(@cost_benefit_analysis)
    assert_response :success
  end

  test "should get edit" do
    get edit_cost_benefit_analysis_url(@cost_benefit_analysis)
    assert_response :success
  end

  test "should update cost_benefit_analysis" do
    patch cost_benefit_analysis_url(@cost_benefit_analysis), params: { cost_benefit_analysis: { benefit: @cost_benefit_analysis.benefit, content: @cost_benefit_analysis.content, cost: @cost_benefit_analysis.cost, slide_id: @cost_benefit_analysis.slide_id } }
    assert_redirected_to cost_benefit_analysis_url(@cost_benefit_analysis)
  end

  test "should destroy cost_benefit_analysis" do
    assert_difference("CostBenefitAnalysis.count", -1) do
      delete cost_benefit_analysis_url(@cost_benefit_analysis)
    end

    assert_redirected_to cost_benefit_analyses_url
  end
end
