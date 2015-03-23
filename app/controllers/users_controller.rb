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

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice]="You have successfully updated #{@user.user_name}!"
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:notice] = "Account destroyed!"
    redirect_to '/'
  end



private
  def user_params
    params.require(:user).permit(:user_name, :email, :password, :password_confirmation)
  end

end