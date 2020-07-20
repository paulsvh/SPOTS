require 'test_helper'

class SessionsControllerTest < ActionDispatch::IntegrationTest
  test "should get welcome" do
    get sessions_welcome_url
    assert_response :success
  end

  test "should get new" do
    get sessions_new_url
    assert_response :success
  end

  test "should get creat" do
    get sessions_creat_url
    assert_response :success
  end

end
