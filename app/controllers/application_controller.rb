class ApplicationController < ActionController::Base
  protect_from_forgery
  
    def current_demand
      Demand.last
    end
    
  private
    def after_sign_in_path_for(resource)
      if current_user.sign_in_count == 1
        registration_companies_path 
      else
      center_index_path
      end
    end
    
   rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, :alert => exception.message
  end
  
end
