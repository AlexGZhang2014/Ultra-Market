class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :current_user
  before_action :require_login, except: [:new, :create, :home]

  def logged_in?
    !!session[:user_account_id]
  end


  private

    def require_login
      redirect_to root_path unless logged_in?
    end

    def current_user
      @current_user ||= UserAccount.find(session[:user_account_id]) if session[:user_account_id]
    end

    helper_method :current_user
end
