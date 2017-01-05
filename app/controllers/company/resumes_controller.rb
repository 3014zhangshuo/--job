class Company::ResumesController < ApplicationController
  before_filter :authenticate_user!
  before_filter :require_recruiter

 def index
   @work = Work.find(params[:work_id])
   @resumes = @work.resumes.order('created_at DESC')
 end
 
end
