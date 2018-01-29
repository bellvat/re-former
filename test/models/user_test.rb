require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
    @user = User.new(id: 1, username: "example user", email: "user@example.com",
                      password: "foobar", password_confirmation: "foobar")
  end

  test "email should be present" do
    @user.email = "    "
    assert_not @user.valid?
  end

  test "email should be saved as lowercase" do
    mixed_case = "Hello@gmail.com"
    @user.email = mixed_case
    @user.save
    assert_equal mixed_case.downcase, @user.reload.email
  end
end
