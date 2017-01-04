class WorksController < ApplicationController

  def index
    @works = case params[:order]
           when 'by_lower_bound'
             Work.where(is_hidden: false).order('wage_lower_bound DESC')
           when 'by_upper_bound'
             Work.where(is_hidden: false).order('wage_upper_bound DESC')
           else
             Work.where(is_hidden: false).order('created_at DESC')
           end
  end

  def show
    @work = Work.find(params[:id])
    #被隐藏的工作不可见
    if @work.is_hidden
      flash[:warning] = "This work already archieved"
      redirect_to root_path
    end
  end
end
