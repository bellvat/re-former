require 'test_helper'

class UserLoginTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:monica)
  end

  test "login with valid information followed by logout" do
    get new_session_path
    post sessions_path, params: {session: {email: @user.email, password: 'password'}}

    assert is_logged_in?
    assert_redirected_to root_path
    follow_redirect!
    assert_select "a[href=?]", sessions_path, count: 0
    assert_select "a[href=?]", session_path(@user)
    delete session_path(@user)
    assert_not is_logged_in?
    assert_redirected_to root_path
    follow_redirect!
    assert_select "a[href=?]", new_session_path
    assert_select "a[href=?]", session_path(@user), count: 0
  end
end
