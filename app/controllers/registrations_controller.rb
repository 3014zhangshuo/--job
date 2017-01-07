class RegistrationsController < Devise::RegistrationsController
  before_action :get_notification

  before_filter :configure_permitted_parameters

 protected

 def configure_permitted_parameters
   devise_parameter_sanitizer.permit(:sign_up, keys: [:status])
 end

 def after_sign_up_path_for(resource)

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

end
