class Admin::WorksController < ApplicationController
  before_filter :require_is_admin
  before_action :authenticate_user!
  before_action :get_notification
  layout "admin"
  def index
    @works = Work.all
  end

  def show
    @work = Work.find(params[:id])
  end

  def edit
    @work = Work.find(params[:id])
  end

  def update
    @work = Work.find(params[:id])
    if @work.update(work_params)
      redirect_to company_work_path(@work)
    else
      render :edit
    end
  end

    def destroy
      @work = Work.find(params[:id])
      @work.destroy
      redirect_to company_works_path
    end

    def publish
    @work = work.find(params[:id])
    @work.is_hidden = false
    @work.save
    redirect_to :back
  end

  def hide
    @work = work.find(params[:id])
    @work.is_hidden = true
    @work.save
    redirect_to :back
  end

  private

  def work_params
    params.require(:work).permit(:title, :description, :wage_upper_bound, :wage_lower_bound, :contact_email, :is_hidden)
  end
end
