class RegistrationsController < Devise::RegistrationsController

  before_filter :configure_permitted_parameters

 protected

 def configure_permitted_parameters
   devise_parameter_sanitizer.permit(:sign_up, keys: [:status])
 end

 def after_sign_up_path_for(resource)
   if current_user && current_user.status == "admin"
     company_works_path
   elsif current_user && current_user.status == "moderator"
    new_applies_path
  else
    root_path
   end
   end

end
