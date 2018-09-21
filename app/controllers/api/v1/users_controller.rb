class Api::V1::UsersController < ApplicationController
  skip_before_action :verify_authentication, only: [:create]
  before_action :set_user, only: [:show, :destroy, :update]
  skip_before_action :verify_authenticity_token, except: [:create, :update, :destroy]
  
  def index
    @users = User.all
  end


  private 
    def set_user
      @user = User.find(params[:id])
    end


end
