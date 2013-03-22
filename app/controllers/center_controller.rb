class CenterController < ApplicationController
  before_filter :authenticate_user!
  
  def seller
      if current_user.roles == 'dealer' || current_user.roles_mask == '3'
        redirect_to :back
      end
  end
  
  def dealer
      if current_user.roles == 'seller' || current_user.roles_mask == '2'
        redirect_to :back
      end
  end
  
end
