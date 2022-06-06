require 'test_helper'

class SessionsControllerTest < ActionDispatch::IntegrationTest
  test "should show login form" do
    get login_url
    assert_response :success
  end

  test "should login" do
    post login_url, params: { name: users(:dela).name, password: 'secret'}
    assert_redirected_to admin_url
  end

  test "should fail login" do
    post login_url, params: { name: users(:dela).name, password: 'wrong'}
    assert_redirected_to login_url
  end

  test "should get destroy" do
    delete logout_url
    assert_redirected_to store_index_url
  end

end
