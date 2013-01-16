class ApplicationController < ActionController::Base
  protect_from_forgery
  
    def current_demand
      Demand.last
    end
    
  private
    def after_sign_in_path_for(resource)
      products_path
    end
end
