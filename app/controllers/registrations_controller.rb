class RegistrationsController < Devise::RegistrationsController

  before_filter :configure_permitted_parameters

 protected

 def configure_permitted_parameters
   devise_parameter_sanitizer.permit(:sign_up, keys: [:status])
 end

 def after_sign_up_path_for(resource)
     if params[:status] = "admin"
       company_works_path
     elsif params[:status] = "moderator"
      root_path
     end
   end

end
