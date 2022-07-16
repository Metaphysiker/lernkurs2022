require "application_system_test_case"

class OpenQuestionsTest < ApplicationSystemTestCase
  setup do
    @open_question = open_questions(:one)
  end

  test "visiting the index" do
    visit open_questions_url
    assert_selector "h1", text: "Open questions"
  end

  test "should create open question" do
    visit open_questions_url
    click_on "New open question"

    fill_in "Content", with: @open_question.content
    fill_in "Correct answer", with: @open_question.correct_answer
    fill_in "Slide", with: @open_question.slide_id
    click_on "Create Open question"

    assert_text "Open question was successfully created"
    click_on "Back"
  end

  test "should update Open question" do
    visit open_question_url(@open_question)
    click_on "Edit this open question", match: :first

    fill_in "Content", with: @open_question.content
    fill_in "Correct answer", with: @open_question.correct_answer
    fill_in "Slide", with: @open_question.slide_id
    click_on "Update Open question"

    assert_text "Open question was successfully updated"
    click_on "Back"
  end

  test "should destroy Open question" do
    visit open_question_url(@open_question)
    click_on "Destroy this open question", match: :first

    assert_text "Open question was successfully destroyed"
  end
end
