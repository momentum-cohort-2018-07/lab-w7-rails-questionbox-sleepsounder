class ApplicationController < ActionController::Base
  helper_method :current_user
  before_action :verify_authentication
  
  
  def verify_authentication
    unless api_token_user
      render json: {error: "You don't have permission to access these resources"}, status: :unauthorized
    end
  end

  protected

    def api_token_user
      @api_token_user ||= authenticate_with_http_token do |token, options|
        User.find_by_api_token(token)
      end
    end

    def current_user
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end
  
    def logged_in?
      !!current_user
    end
  
    # def authenticate
    #   redirect_to login_path unless logged_in?
    # end
end
