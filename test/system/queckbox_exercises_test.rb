require "application_system_test_case"

class QueckboxExercisesTest < ApplicationSystemTestCase
  setup do
    @queckbox_exercise = queckbox_exercises(:one)
  end

  test "visiting the index" do
    visit queckbox_exercises_url
    assert_selector "h1", text: "Queckbox exercises"
  end

  test "should create queckbox exercise" do
    visit queckbox_exercises_url
    click_on "New queckbox exercise"

    fill_in "Content", with: @queckbox_exercise.content
    click_on "Create Queckbox exercise"

    assert_text "Queckbox exercise was successfully created"
    click_on "Back"
  end

  test "should update Queckbox exercise" do
    visit queckbox_exercise_url(@queckbox_exercise)
    click_on "Edit this queckbox exercise", match: :first

    fill_in "Content", with: @queckbox_exercise.content
    click_on "Update Queckbox exercise"

    assert_text "Queckbox exercise was successfully updated"
    click_on "Back"
  end

  test "should destroy Queckbox exercise" do
    visit queckbox_exercise_url(@queckbox_exercise)
    click_on "Destroy this queckbox exercise", match: :first

    assert_text "Queckbox exercise was successfully destroyed"
  end
end
