require "test_helper"

class SortingExercisesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @sorting_exercise = sorting_exercises(:one)
  end

  test "should get index" do
    get sorting_exercises_url
    assert_response :success
  end

  test "should get new" do
    get new_sorting_exercise_url
    assert_response :success
  end

  test "should create sorting_exercise" do
    assert_difference("SortingExercise.count") do
      post sorting_exercises_url, params: { sorting_exercise: { content: @sorting_exercise.content, solution: @sorting_exercise.solution } }
    end

    assert_redirected_to sorting_exercise_url(SortingExercise.last)
  end

  test "should show sorting_exercise" do
    get sorting_exercise_url(@sorting_exercise)
    assert_response :success
  end

  test "should get edit" do
    get edit_sorting_exercise_url(@sorting_exercise)
    assert_response :success
  end

  test "should update sorting_exercise" do
    patch sorting_exercise_url(@sorting_exercise), params: { sorting_exercise: { content: @sorting_exercise.content, solution: @sorting_exercise.solution } }
    assert_redirected_to sorting_exercise_url(@sorting_exercise)
  end

  test "should destroy sorting_exercise" do
    assert_difference("SortingExercise.count", -1) do
      delete sorting_exercise_url(@sorting_exercise)
    end

    assert_redirected_to sorting_exercises_url
  end
end
