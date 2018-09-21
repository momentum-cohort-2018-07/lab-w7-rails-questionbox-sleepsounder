class UsersController < ApplicationController
  skip_before_action :verify_authentication
  
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def edit 
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    if @user.save 
      redirect_to root_path
    else
      render 'new'
    end
  end

  def destroy
    @user = User.delete
  end

  private
  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end

end
