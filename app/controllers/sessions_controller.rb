class SessionsController < ApplicationController
  def new
    @user_account = UserAccount.new
  end

  def create_user_with_github
    @user_account = UserAccount.find_or_create_by(uid: auth['uid']) do |u|
      u.username = auth['info']['name']
      u.email = auth['info']['email']
      u.image = auth['info']['image']
    end

    session[:user_account_id] = @user_account.id

    render "home"
  end

  def home
    @user_account = UserAccount.find_or_create_by(uid: auth['uid']) do |u|
      u.username = auth['info']['name']
      u.email = auth['info']['email']
      u.image = auth['info']['image']
    end
  end

  def create
    @user_account = UserAccount.find_by(username: params[:username])
    if @user_account && @user_account.authenticate(params[:password])
      session[:user_account_id] = @user_account.id
      redirect_to user_account_path(@user_account)
    else
      flash[:notice] = "Incorrect username and/or password."
      redirect_to controller: "sessions", action: "new"
    end
  end

  def destroy
    session.clear
    redirect_to root_path
  end

  private

  def auth
    request.env['omniauth.auth']
  end
end
