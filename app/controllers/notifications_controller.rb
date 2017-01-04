class NotificationsController < ApplicationController
  def redirect_notification
    @notification = Notification.find_by_id(params[:id])

    if @notification.present? && @notification.notifiable_type == "Work"
      @work = Work.find(@notification.notifiable_id)
      @notification.read_at = DateTime.now
      @notification.save
      redirect_to company_work_path(@work)
    elsif @notification.present? && @notification.notifiable_type == "Resume"
      @work = Work.find(@notification.notifiable_id)
      @notification.read_at = DateTime.now
      @notification.save
      redirect_to "/"
    end
  end


end
