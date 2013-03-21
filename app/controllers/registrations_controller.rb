class RegistrationsController < Devise::RegistrationsController
  def  after_sign_up_path_for(resource)
    product_path(resource)
  end
  
   def new_worker

  end
  
end
