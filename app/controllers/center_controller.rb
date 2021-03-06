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
    
    if @message.save
      event = Event.create(:object_id => @message.id, :company_id => company.id, :type_mask => '4')
      format.js
    end
  end
  
  def show
    @inactive_workers = User.where(:state => 'inactive') 
    
    @active_workers = User.where(:state => 'active')
  end
  
  def edit_worker
    
  end
  
end
