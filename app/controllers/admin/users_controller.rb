class Admin::UsersController < ApplicationController
  before_filter :authorize_admin!
  def index
    @users = User.all
  end

  def destroy
    @user = User.find(params[:id]).destroy
    flash[:notice] = "User Deleted"
    redirect_to admin_users_path
  end
end
