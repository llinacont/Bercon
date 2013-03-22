class UsersController < ApplicationController
  def new
     @user = User.new
end

def create
    @user = User.new(params[:user])
    if @user.save
        redirect_to user_session_path
    else
    redirect_to new_user_session_path
end

end

def show
    @user = User.find(params[:id])
    #redirect_to @user
end
end
