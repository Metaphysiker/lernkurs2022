require "test_helper"

class OpenQuestionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @open_question = open_questions(:one)
  end

  test "should get index" do
    get open_questions_url
    assert_response :success
  end

  test "should get new" do
    get new_open_question_url
    assert_response :success
  end

  test "should create open_question" do
    assert_difference("OpenQuestion.count") do
      post open_questions_url, params: { open_question: { content: @open_question.content, correct_answer: @open_question.correct_answer, slide_id: @open_question.slide_id } }
    end

    assert_redirected_to open_question_url(OpenQuestion.last)
  end

  test "should show open_question" do
    get open_question_url(@open_question)
    assert_response :success
  end

  test "should get edit" do
    get edit_open_question_url(@open_question)
    assert_response :success
  end

  test "should update open_question" do
    patch open_question_url(@open_question), params: { open_question: { content: @open_question.content, correct_answer: @open_question.correct_answer, slide_id: @open_question.slide_id } }
    assert_redirected_to open_question_url(@open_question)
  end

  test "should destroy open_question" do
    assert_difference("OpenQuestion.count", -1) do
      delete open_question_url(@open_question)
    end

    assert_redirected_to open_questions_url
  end
end
