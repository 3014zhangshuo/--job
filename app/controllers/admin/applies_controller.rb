class Admin::AppliesController < ApplicationController
  before_filter :require_is_admin
  before_action :authenticate_user!
  before_action :get_notification
  layout "admin"
  def index
    @applies = Apply.all
  end

  def show
    @apply = Apply.find(params[:id])
  end

  def destroy
    @apply = Apply.find(params[:id])
    @apply.destroy
    redirect_to admin_applies_path
  end

  def passing
    @apply = Apply.find(params[:id])
    @apply.passing!
  end

  def failed
    @apply = Apply.find(params[:id])
    @apply.failed!
  end

  def application
    @apply = Apply.find(params[:id])
    @apply.is_pass = true
    @apply.passed!
    @apply.save
    @apply.user.is_recruiter = true
    @apply.user.status = "user"
    @apply.user.save
    @pass = @apply.user
    send_notification(current_user.id,@apply.user.id,@pass)
    redirect_to :back
  end

end
