class RegistrationsController < Devise::RegistrationsController
  
  def  after_sign_up_path_for(resource)
    product_path(resource)
  end
  
end
