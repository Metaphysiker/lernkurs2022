require "application_system_test_case"

class ClozesTest < ApplicationSystemTestCase
  setup do
    @cloze = clozes(:one)
  end

  test "visiting the index" do
    visit clozes_url
    assert_selector "h1", text: "Clozes"
  end

  test "should create cloze" do
    visit clozes_url
    click_on "New cloze"

    fill_in "Content", with: @cloze.content
    fill_in "Correct answer", with: @cloze.correct_answer
    fill_in "Slide", with: @cloze.slide_id
    click_on "Create Cloze"

    assert_text "Cloze was successfully created"
    click_on "Back"
  end

  test "should update Cloze" do
    visit cloze_url(@cloze)
    click_on "Edit this cloze", match: :first

    fill_in "Content", with: @cloze.content
    fill_in "Correct answer", with: @cloze.correct_answer
    fill_in "Slide", with: @cloze.slide_id
    click_on "Update Cloze"

    assert_text "Cloze was successfully updated"
    click_on "Back"
  end

  test "should destroy Cloze" do
    visit cloze_url(@cloze)
    click_on "Destroy this cloze", match: :first

    assert_text "Cloze was successfully destroyed"
  end
end
