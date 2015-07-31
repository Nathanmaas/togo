class UsersController < ApplicationController

  # before_action :check_no_auth

  def new
    @user = User.new
  end

  def create
    @user = User.create user_params
    if @user.persisted?
      flash[:success] = "You are signed up. Login below."
      redirect_to login_path
    else
      flash[:danger] = "Invalid email or password"
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to todo_items_path
  end

  private

  def user_params
    params.require(:user).permit(:email,:password)
  end

end
