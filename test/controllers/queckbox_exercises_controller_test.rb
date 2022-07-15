require "test_helper"

class QueckboxExercisesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @queckbox_exercise = queckbox_exercises(:one)
  end

  test "should get index" do
    get queckbox_exercises_url
    assert_response :success
  end

  test "should get new" do
    get new_queckbox_exercise_url
    assert_response :success
  end

  test "should create queckbox_exercise" do
    assert_difference("QueckboxExercise.count") do
      post queckbox_exercises_url, params: { queckbox_exercise: { content: @queckbox_exercise.content } }
    end

    assert_redirected_to queckbox_exercise_url(QueckboxExercise.last)
  end

  test "should show queckbox_exercise" do
    get queckbox_exercise_url(@queckbox_exercise)
    assert_response :success
  end

  test "should get edit" do
    get edit_queckbox_exercise_url(@queckbox_exercise)
    assert_response :success
  end

  test "should update queckbox_exercise" do
    patch queckbox_exercise_url(@queckbox_exercise), params: { queckbox_exercise: { content: @queckbox_exercise.content } }
    assert_redirected_to queckbox_exercise_url(@queckbox_exercise)
  end

  test "should destroy queckbox_exercise" do
    assert_difference("QueckboxExercise.count", -1) do
      delete queckbox_exercise_url(@queckbox_exercise)
    end

    assert_redirected_to queckbox_exercises_url
  end
end
