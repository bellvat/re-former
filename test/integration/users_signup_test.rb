require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest
  def setup
    @user = User.create(username: "monica", email: "monica", password:"monica",
    password_confirmation: "monica")
  end

  test "invalid user setup" do
    get new_user_path
    assert_no_difference 'User.count' do
      post users_path, params:{user:{name: "hello",
        email:"monica",
        password: "hello",
        password_confirmation: "hello"}}
    end
    assert_template 'users/new'
  end
end
