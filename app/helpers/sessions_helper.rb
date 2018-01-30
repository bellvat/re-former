module SessionsHelper
  def log_in(user)
    session[:user_id]= user.id
  end
  #@current_user is simply an instance variable from the method?
  def current_user
    @current_user ||= User.find_by(id:session[:user_id])
  end

  def logged_in?
    !current_user.nil?
  end

  def log_out
    #log user out
    session.delete(:user_id)
    #reset @current_user to nil
    @current_user = nil
  end
end
