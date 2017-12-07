require 'test_helper'

class AdminPagesControllerTest < ActionDispatch::IntegrationTest
  test "should get main" do
    get admin_pages_main_url
    assert_response :success
  end

  test "should get users" do
    get admin_pages_users_url
    assert_response :success
  end

  test "should get projects" do
    get admin_pages_projects_url
    assert_response :success
  end

  test "should get follows" do
    get admin_pages_follows_url
    assert_response :success
  end

end
