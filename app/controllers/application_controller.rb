class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def after_sign_in_path_for(resource)
    if current_user && current_user.admin?
        admin_users_path
    elsif current_user && current_user.status == "moderator"
        new_apply_path
    elsif current_user && current_user.recruiter?
        company_works_path
    else
        root_path
    end
  end

  def require_recruiter
    if !current_user.recruiter?
      flash[:alert] = 'You are not recruiter'
      redirect_to root_path
    end
  end

  def require_is_admin
    if !current_user.admin?
      flash[:alert] = 'You are not admin'
      redirect_to root_path
    end
  end

  #获取当前用户的notifications
  def get_notification
    if current_user.present?
      @notifications = Notification.where(:recipient_id => current_user.id).where(:read_at => nil)
    end
  end


  #创建notifications方法
 def send_notification(trigger,recipient,notifiable)
   Notification.create(trigger_id: trigger,recipient_id: recipient,notifiable_id: notifiable.id,notifiable_type: notifiable.class)
 end
#资料查找不见回传的错误信息
 rescue_from ActiveRecord::RecordNotFound do
   flash[:warning] = '资料查找不见'
   redirect_back_or root_path
 end

 def redirect_back_or(path)
   redirect_to request.referer || path
 end

end
