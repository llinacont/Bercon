class ApplicationController < ActionController::Base
  protect_from_forgery
  class ApplicationController < ActionController::Base
    def after_sign_in_path_for(resource)
      request.env['omniauth.origin'] || stored_location_for(resource) || product_path
    end
  end
end
