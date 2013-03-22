class RegistrationsController < Devise::RegistrationsController
  
  def  after_sign_up_path_for(resource)
    product_path(resource)
  end
  
  def new_worker
    resource = build_worker({})
    respond_with resource
  end
  
  def create_worker
    build_worker
    redirect_to :back
  end
  
end
