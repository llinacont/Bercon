class UsersController < ApplicationController
  
  def index
    @users = User.where(:company_id => current_user.company_id)
  end
  
  def new
    @user = User.new
    @users = User.where(:company_id => current_user.company_id)

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user }
    end
  end
  
  def create
    @user = User.new(params[:user])
               
    respond_to do |format|
      if @user.save
        event = Event.create(:object_id => @user.id, :company_id => current_user.id, :type_mask => '1')
        format.html {redirect_to :back}
      else
          format.html { render action: "new" }
          format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    debugger
    @user = User.find(params[:id])
    roles = params[:user]
    roles.each do |key,value|
      @role = value.to_i
    end
    states = params[:post]
    states.each do |key,value|
      @state = value
    end 
 
    respond_to do |format|
      if @user.update_attributes(:roles_mask => @role,:state => @state)
        flash[:notice] = "Empleado actualizado correctamente"
        UserMailer.confirmation_email(self).deliver
        format.html { redirect_to :controller => "center" }
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
