require "application_system_test_case"

class PointSystemsTest < ApplicationSystemTestCase
  setup do
    @point_system = point_systems(:one)
  end

  test "visiting the index" do
    visit point_systems_url
    assert_selector "h1", text: "Point systems"
  end

  test "should create point system" do
    visit point_systems_url
    click_on "New point system"

    fill_in "Points deduction for mistake", with: @point_system.points_deduction_for_mistake
    fill_in "Total possible points", with: @point_system.total_possible_points
    click_on "Create Point system"

    assert_text "Point system was successfully created"
    click_on "Back"
  end

  test "should update Point system" do
    visit point_system_url(@point_system)
    click_on "Edit this point system", match: :first

    fill_in "Points deduction for mistake", with: @point_system.points_deduction_for_mistake
    fill_in "Total possible points", with: @point_system.total_possible_points
    click_on "Update Point system"

    assert_text "Point system was successfully updated"
    click_on "Back"
  end

  test "should destroy Point system" do
    visit point_system_url(@point_system)
    click_on "Destroy this point system", match: :first

    assert_text "Point system was successfully destroyed"
  end
end
