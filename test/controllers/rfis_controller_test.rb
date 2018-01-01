require 'test_helper'

class RfisControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get rfis_new_url
    assert_response :success
  end

  test "should get edit" do
    get rfis_edit_url
    assert_response :success
  end

  test "should get show" do
    get rfis_show_url
    assert_response :success
  end

  test "should get index" do
    get rfis_index_url
    assert_response :success
  end

end
