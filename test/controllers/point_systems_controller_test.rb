require "test_helper"

class PointSystemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @point_system = point_systems(:one)
  end

  test "should get index" do
    get point_systems_url
    assert_response :success
  end

  test "should get new" do
    get new_point_system_url
    assert_response :success
  end

  test "should create point_system" do
    assert_difference("PointSystem.count") do
      post point_systems_url, params: { point_system: { points_deduction_for_mistake: @point_system.points_deduction_for_mistake, total_possible_points: @point_system.total_possible_points } }
    end

    assert_redirected_to point_system_url(PointSystem.last)
  end

  test "should show point_system" do
    get point_system_url(@point_system)
    assert_response :success
  end

  test "should get edit" do
    get edit_point_system_url(@point_system)
    assert_response :success
  end

  test "should update point_system" do
    patch point_system_url(@point_system), params: { point_system: { points_deduction_for_mistake: @point_system.points_deduction_for_mistake, total_possible_points: @point_system.total_possible_points } }
    assert_redirected_to point_system_url(@point_system)
  end

  test "should destroy point_system" do
    assert_difference("PointSystem.count", -1) do
      delete point_system_url(@point_system)
    end

    assert_redirected_to point_systems_url
  end
end
