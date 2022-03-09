require 'test_helper'

class HomeControllerTest < ActionDispatch::IntegrationTest
  test "should get top" do
    get home_top_url
    assert_response :success
  end

  test "should get about" do
    get home_about_url
    assert_response :success
  end

  test "should get seminar" do
    get home_seminar_url
    assert_response :success
  end

  test "should get system" do
    get home_system_url
    assert_response :success
  end

end
