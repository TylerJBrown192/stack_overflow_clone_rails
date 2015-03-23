class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "Thanks for joining!"
      redirect_to users_path
    else
      flash[:alert] = "There was an error, try again please."
      redirect_to :back
    end
  end


private
  def user_params
    params.require(:user).permit(:user_name, :email, :password, :password_confirmation)
  end
  
end
