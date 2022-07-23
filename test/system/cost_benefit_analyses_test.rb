require "application_system_test_case"

class CostBenefitAnalysesTest < ApplicationSystemTestCase
  setup do
    @cost_benefit_analysis = cost_benefit_analyses(:one)
  end

  test "visiting the index" do
    visit cost_benefit_analyses_url
    assert_selector "h1", text: "Cost benefit analyses"
  end

  test "should create cost benefit analysis" do
    visit cost_benefit_analyses_url
    click_on "New cost benefit analysis"

    fill_in "Benefit", with: @cost_benefit_analysis.benefit
    fill_in "Content", with: @cost_benefit_analysis.content
    fill_in "Cost", with: @cost_benefit_analysis.cost
    fill_in "Slide", with: @cost_benefit_analysis.slide_id
    click_on "Create Cost benefit analysis"

    assert_text "Cost benefit analysis was successfully created"
    click_on "Back"
  end

  test "should update Cost benefit analysis" do
    visit cost_benefit_analysis_url(@cost_benefit_analysis)
    click_on "Edit this cost benefit analysis", match: :first

    fill_in "Benefit", with: @cost_benefit_analysis.benefit
    fill_in "Content", with: @cost_benefit_analysis.content
    fill_in "Cost", with: @cost_benefit_analysis.cost
    fill_in "Slide", with: @cost_benefit_analysis.slide_id
    click_on "Update Cost benefit analysis"

    assert_text "Cost benefit analysis was successfully updated"
    click_on "Back"
  end

  test "should destroy Cost benefit analysis" do
    visit cost_benefit_analysis_url(@cost_benefit_analysis)
    click_on "Destroy this cost benefit analysis", match: :first

    assert_text "Cost benefit analysis was successfully destroyed"
  end
end
