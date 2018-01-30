class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    #@user = User.new(username:params['username'], email:params['email'], password:params['password'])
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "Welcome to the app!"
      redirect_to static_pages_home_path
    else
      render :new
    end
  end

  def edit
    @user = User.find_by_id(params[:id])
  end

  def update
    @user = User.find_by_id(params[:id])
    @user.update_attributes(user_params)

    if @user.valid?
      redirect_to new_user_path
    else
      flash.now[:error] = "Please resubmit!"
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end
end
