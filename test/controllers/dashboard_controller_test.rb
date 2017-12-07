require 'test_helper'

class DashboardControllerTest < ActionDispatch::IntegrationTest
  test "should get main" do
    get dashboard_main_url
    assert_response :success
  end

  test "should get admin" do
    get dashboard_admin_url
    assert_response :success
  end

end
