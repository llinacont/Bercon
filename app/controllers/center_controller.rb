class CenterController < ApplicationController

  before_filter :authenticate_user!
  before_filter :state_check
  
  def seller
      if current_user.roles == 'dealer' || current_user.roles_mask == '3'
        debugger
        redirect_to :back
      end
  end
  
  def dealer
      if current_user.roles == 'seller' || current_user.roles_mask == '2'
        redirect_to :back
      end
  end
  
  def timeline
    
  end
  
  def timeline_processing
    
  end
  
  def messages
    @messages = Message.where(:receiver_id => current_user.id)

    render :layout => 'ajax_layout'
  end
  
  def new_message
    @message = Message.new
    
    render :layout => 'ajax_layout'
  end
  
  def process_new_message
    debugger
    @message = Message.new(params[:message])
    @message.sender_id = current_user.id

    @message.save!
  end
  
end
