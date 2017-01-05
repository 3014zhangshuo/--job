class AppliesController < ApplicationController
  before_action :get_notification
  def new
    @apply = Apply.new
  end

  def create
    @user = User.find_by_is_admin(true)
    @apply = Apply.new(apply_params)
    @apply.user = current_user

    if @apply.save
      send_notification(current_user.id,@user.id,@apply)
      flash[:notice] = "成功提交申请，我们会在2个工作日审核完成，请耐心等待"
      redirect_to new_apply_path
    else
      render :new
    end
  end

  private

  def apply_params
    params.require(:apply).permit(:name, :description, :start, :number, :integer, :web, :phone, :picture)
  end
end
