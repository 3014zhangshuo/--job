class ApplysController < ApplicationController
  def new
    @apply = Apply.new
  end

  def create
    @user = User.find_by_is_admin(true)
    @apply = Apply.new(apply_params)
    @apply.user = current_user

    if @apply.save
      send_notification(current_user.id,@user.id,@apply)
      flash[:notice] = "成功提交履历"
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def apply_params
    params.require(:apply).permit(:name, :description, :start, :number, :integer, :web, :phone, :picture)
  end
end
