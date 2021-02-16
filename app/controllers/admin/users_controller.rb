class Admin::UsersController < ApplicationController

  def index
    @users = User.all
  end

  def add_admin
    @user = User.find(params[:id])
    @user.update(is_admin: true)
  end

  def remove_admin
    @user = User.find(params[:id])
    @user.update(is_admin: false)
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password)
  end

end