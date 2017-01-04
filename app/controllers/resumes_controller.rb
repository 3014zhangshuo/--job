class ResumesController < ApplicationController
  before_action :authenticate_user!

  def new
    @work = work.find(params[:work_id])
    @resume = Resume.new
  end

  def create
    @work = work.find(params[:work_id])
    @resume = Resume.new(resume_params)
    @resume.work = @work
    @resume.user = current_user

    if @resume.save
      flash[:notice] = "成功提交履历"
      redirect_to work_path(@work)
    else
      render :new
    end
  end

  private

  def resume_params
    params.require(:resume).permit(:content, :attachment)
  end
end
