class UsersController < ApplicationController
  
  def index
    @users = User.where(:company_id => current_user.company_id)
  end
  
  def new
      @user = User.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user }
    end
end

def create
  debugger
    @user = User.new(params[:user])
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

def update
    debugger
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to center_path }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

def show
    @user = User.find(params[:id])
    #redirect_to @user
end

def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to products_url }
      format.json { head :no_content }
    end
end
  
end
