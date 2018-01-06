require 'test_helper'

class ReturnsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get returns_new_url
    assert_response :success
  end

  test "should get edit" do
    get returns_edit_url
    assert_response :success
  end

  test "should get show" do
    get returns_show_url
    assert_response :success
  end

  test "should get index" do
    get returns_index_url
    assert_response :success
  end

end
