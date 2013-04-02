class UsersController < ApplicationController
  def new
      @user = User.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user }
    end
end

def create
    @user = User.new(params[:user])
    if @user.company_id != nil
      @event = @user.events.build(:company_id => @user.company_id, :type_mask => '1')
    else
    @event = @user.events.build(:company_id => current_user.id, :type_mask => '1')
    end
    
    respond_to do |format|
      if @user.save
        format.html { redirect_to center_index_path }
        format.json { render json: @user, status: :created, location: @user }
      else
        format.html { render action: "new" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
end

def show
    @user = User.find(params[:id])
    #redirect_to @user
end
end
