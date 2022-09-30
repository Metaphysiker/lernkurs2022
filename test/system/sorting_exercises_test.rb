require "application_system_test_case"

class SortingExercisesTest < ApplicationSystemTestCase
  setup do
    @sorting_exercise = sorting_exercises(:one)
  end

  test "visiting the index" do
    visit sorting_exercises_url
    assert_selector "h1", text: "Sorting exercises"
  end

  test "should create sorting exercise" do
    visit sorting_exercises_url
    click_on "New sorting exercise"

    fill_in "Content", with: @sorting_exercise.content
    fill_in "Solution", with: @sorting_exercise.solution
    click_on "Create Sorting exercise"

    assert_text "Sorting exercise was successfully created"
    click_on "Back"
  end

  test "should update Sorting exercise" do
    visit sorting_exercise_url(@sorting_exercise)
    click_on "Edit this sorting exercise", match: :first

    fill_in "Content", with: @sorting_exercise.content
    fill_in "Solution", with: @sorting_exercise.solution
    click_on "Update Sorting exercise"

    assert_text "Sorting exercise was successfully updated"
    click_on "Back"
  end

  test "should destroy Sorting exercise" do
    visit sorting_exercise_url(@sorting_exercise)
    click_on "Destroy this sorting exercise", match: :first

    assert_text "Sorting exercise was successfully destroyed"
  end
end
