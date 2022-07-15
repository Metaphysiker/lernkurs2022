require "application_system_test_case"

class CheckboxExercisesTest < ApplicationSystemTestCase
  setup do
    @checkbox_exercise = checkbox_exercises(:one)
  end

  test "visiting the index" do
    visit checkbox_exercises_url
    assert_selector "h1", text: "Checkbox exercises"
  end

  test "should create checkbox exercise" do
    visit checkbox_exercises_url
    click_on "New checkbox exercise"

    fill_in "Content", with: @checkbox_exercise.content
    click_on "Create Checkbox exercise"

    assert_text "Checkbox exercise was successfully created"
    click_on "Back"
  end

  test "should update Checkbox exercise" do
    visit checkbox_exercise_url(@checkbox_exercise)
    click_on "Edit this checkbox exercise", match: :first

    fill_in "Content", with: @checkbox_exercise.content
    click_on "Update Checkbox exercise"

    assert_text "Checkbox exercise was successfully updated"
    click_on "Back"
  end

  test "should destroy Checkbox exercise" do
    visit checkbox_exercise_url(@checkbox_exercise)
    click_on "Destroy this checkbox exercise", match: :first

    assert_text "Checkbox exercise was successfully destroyed"
  end
end
