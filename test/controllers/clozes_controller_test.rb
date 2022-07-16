require "test_helper"

class ClozesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @cloze = clozes(:one)
  end

  test "should get index" do
    get clozes_url
    assert_response :success
  end

  test "should get new" do
    get new_cloze_url
    assert_response :success
  end

  test "should create cloze" do
    assert_difference("Cloze.count") do
      post clozes_url, params: { cloze: { content: @cloze.content, correct_answer: @cloze.correct_answer, slide_id: @cloze.slide_id } }
    end

    assert_redirected_to cloze_url(Cloze.last)
  end

  test "should show cloze" do
    get cloze_url(@cloze)
    assert_response :success
  end

  test "should get edit" do
    get edit_cloze_url(@cloze)
    assert_response :success
  end

  test "should update cloze" do
    patch cloze_url(@cloze), params: { cloze: { content: @cloze.content, correct_answer: @cloze.correct_answer, slide_id: @cloze.slide_id } }
    assert_redirected_to cloze_url(@cloze)
  end

  test "should destroy cloze" do
    assert_difference("Cloze.count", -1) do
      delete cloze_url(@cloze)
    end

    assert_redirected_to clozes_url
  end
end
