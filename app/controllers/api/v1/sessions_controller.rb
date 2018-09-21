class Api::V1::SessionsController < ApplicationController
    skip_before_action :verify_authentication
    skip_before_action :verify_authenticity_token, except: [:create, :update, :destroy]
    
  def create
    user = User.find_by_email(params[:email])
    if user && user.authentication(params[:password])
        render json: {token: user.api_token}
    else
        render json: {error: "Ain't valid mon frere!"}, status: :unauthorized
    end
  end
end


