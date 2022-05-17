require "application_system_test_case"

class QuizQuestionsTest < ApplicationSystemTestCase
  setup do
    @quiz_question = quiz_questions(:one)
  end

  test "visiting the index" do
    visit quiz_questions_url
    assert_selector "h1", text: "Quiz questions"
  end

  test "should create quiz question" do
    visit quiz_questions_url
    click_on "New quiz question"

    fill_in "Content", with: @quiz_question.content
    fill_in "Correct anwer", with: @quiz_question.correct_anwer
    click_on "Create Quiz question"

    assert_text "Quiz question was successfully created"
    click_on "Back"
  end

  test "should update Quiz question" do
    visit quiz_question_url(@quiz_question)
    click_on "Edit this quiz question", match: :first

    fill_in "Content", with: @quiz_question.content
    fill_in "Correct anwer", with: @quiz_question.correct_anwer
    click_on "Update Quiz question"

    assert_text "Quiz question was successfully updated"
    click_on "Back"
  end

  test "should destroy Quiz question" do
    visit quiz_question_url(@quiz_question)
    click_on "Destroy this quiz question", match: :first

    assert_text "Quiz question was successfully destroyed"
  end
end
