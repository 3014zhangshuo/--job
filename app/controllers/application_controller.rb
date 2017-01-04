class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  def after_sign_in_path_for(resource)
      if current_user && current_user.status == "admin"
        company_works_path
      elsif current_user && current_user.status == "user"
       root_path
     else
       root_path
      end
    end

end
