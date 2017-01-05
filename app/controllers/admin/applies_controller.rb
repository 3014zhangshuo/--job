class Admin::AppliesController < ApplicationController
  before_filter :require_is_admin
  before_action :authenticate_user!
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

  def application
    @apply = Apply.find(params[:id])
    @apply.user.is_recruiter = true
    @apply.user.save
    send_notification(current_user.id,@apply.user.id,@apply)
    redirect_to :back
  end

end
