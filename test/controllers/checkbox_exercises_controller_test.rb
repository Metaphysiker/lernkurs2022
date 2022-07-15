require "test_helper"

class CheckboxExercisesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @checkbox_exercise = checkbox_exercises(:one)
  end

  test "should get index" do
    get checkbox_exercises_url
    assert_response :success
  end

  test "should get new" do
    get new_checkbox_exercise_url
    assert_response :success
  end

  test "should create checkbox_exercise" do
    assert_difference("CheckboxExercise.count") do
      post checkbox_exercises_url, params: { checkbox_exercise: { content: @checkbox_exercise.content } }
    end

    assert_redirected_to checkbox_exercise_url(CheckboxExercise.last)
  end

  test "should show checkbox_exercise" do
    get checkbox_exercise_url(@checkbox_exercise)
    assert_response :success
  end

  test "should get edit" do
    get edit_checkbox_exercise_url(@checkbox_exercise)
    assert_response :success
  end

  test "should update checkbox_exercise" do
    patch checkbox_exercise_url(@checkbox_exercise), params: { checkbox_exercise: { content: @checkbox_exercise.content } }
    assert_redirected_to checkbox_exercise_url(@checkbox_exercise)
  end

  test "should destroy checkbox_exercise" do
    assert_difference("CheckboxExercise.count", -1) do
      delete checkbox_exercise_url(@checkbox_exercise)
    end

    assert_redirected_to checkbox_exercises_url
  end
end
