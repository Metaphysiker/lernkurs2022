require "application_system_test_case"

class CheckboxesTest < ApplicationSystemTestCase
  setup do
    @checkbox = checkboxes(:one)
  end

  test "visiting the index" do
    visit checkboxes_url
    assert_selector "h1", text: "Checkboxes"
  end

  test "should create checkbox" do
    visit checkboxes_url
    click_on "New checkbox"

    fill_in "Checkbox exercise", with: @checkbox.checkbox_exercise_id
    fill_in "Content", with: @checkbox.content
    click_on "Create Checkbox"

    assert_text "Checkbox was successfully created"
    click_on "Back"
  end

  test "should update Checkbox" do
    visit checkbox_url(@checkbox)
    click_on "Edit this checkbox", match: :first

    fill_in "Checkbox exercise", with: @checkbox.checkbox_exercise_id
    fill_in "Content", with: @checkbox.content
    click_on "Update Checkbox"

    assert_text "Checkbox was successfully updated"
    click_on "Back"
  end

  test "should destroy Checkbox" do
    visit checkbox_url(@checkbox)
    click_on "Destroy this checkbox", match: :first

    assert_text "Checkbox was successfully destroyed"
  end
end
