require 'test_helper'

class InquiryControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get inquiry_index_url
    assert_response :success
  end

  test "should get new" do
    get inquiry_new_url
    assert_response :success
  end

  test "should get create" do
    get inquiry_create_url
    assert_response :success
  end

  test "should get show" do
    get inquiry_show_url
    assert_response :success
  end

end
