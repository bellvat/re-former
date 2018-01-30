require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
  #below is same as logged_in? method in sessions helper, but the
  #session helper method cannot be accessed in test, so we need to define here
  def is_logged_in?
    !session[:user_id].nil?
  end
end
