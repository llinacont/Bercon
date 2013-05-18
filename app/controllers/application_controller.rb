class ApplicationController < ActionController::Base
  protect_from_forgery
  
    def current_demand
      Demand.last
    end
    
    def current_company
      Company.find(:user_id => current_user.id)
    end
    
    def state_check
      if current_user.state != 'active'
        flash[:notice] = "Tu cuenta no ha sido activada aun"
        redirect_to home_hello_path
      end 
    end
    
  private
  
    def after_sign_in_path_for(resource)
      if current_user.sign_in_count == 1 && current_user.roles_mask == 1
      registration_companies_path
      
      elsif current_user.roles_mask == 1
      center_index_path
     
      elsif current_user.roles_mask == 2
      dealer_path
  
      
      elsif current_user.roles_mask == 3
      seller_path
      end
      
    end
    
   rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, :alert => exception.message
  end
  
end
