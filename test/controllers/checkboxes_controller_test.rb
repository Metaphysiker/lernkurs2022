require "test_helper"

class CheckboxesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @checkbox = checkboxes(:one)
  end

  test "should get index" do
    get checkboxes_url
    assert_response :success
  end

  test "should get new" do
    get new_checkbox_url
    assert_response :success
  end

  test "should create checkbox" do
    assert_difference("Checkbox.count") do
      post checkboxes_url, params: { checkbox: { checkbox_exercise_id: @checkbox.checkbox_exercise_id, content: @checkbox.content } }
    end

    assert_redirected_to checkbox_url(Checkbox.last)
  end

  test "should show checkbox" do
    get checkbox_url(@checkbox)
    assert_response :success
  end

  test "should get edit" do
    get edit_checkbox_url(@checkbox)
    assert_response :success
  end

  test "should update checkbox" do
    patch checkbox_url(@checkbox), params: { checkbox: { checkbox_exercise_id: @checkbox.checkbox_exercise_id, content: @checkbox.content } }
    assert_redirected_to checkbox_url(@checkbox)
  end

  test "should destroy checkbox" do
    assert_difference("Checkbox.count", -1) do
      delete checkbox_url(@checkbox)
    end

    assert_redirected_to checkboxes_url
  end
end
