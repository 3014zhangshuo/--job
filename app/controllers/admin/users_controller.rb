class Admin::UsersController < ApplicationController
  before_filter :require_is_admin

  def index
    @users = User.all
  end

  def show
   @user = User.find(params[:id])
 end

 def destroy
   @user = User.find(params[:id])
   @user.destroy
   redirect_to admin_users_path
 end

 def change_admin
   @user = User.find(params[:id])
   @user.admin!
   redirect_to :back
 end


 def change_user
   @user = User.find(params[:id])
   @user.user!
   redirect_to :back
 end
end
