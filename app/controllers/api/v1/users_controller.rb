class Api::V1::UsersController < ApplicationController
  skip_before_action :verify_authentication, only: [:create]
  before_action :set_user, only: [:show, :destroy, :update]
  def index
    @users = User.all
  end


  private 
    def set_user
      @user = User.find(params[:id])
    end


end
