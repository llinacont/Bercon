class CenterController < ApplicationController
  before_filter :authenticate_user!
  
  def seller
      authorize!
  end
  
  def dealer
      authorize!
  end
end
