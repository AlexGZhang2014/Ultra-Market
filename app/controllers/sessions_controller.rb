class SessionsController < ApplicationController
  def new
    @user_account = UserAccount.new
  end

  def create
    @user_account = UserAccount.find(username: params[:username])
    if @user_account && @user_account.authenticate(params[:password])
      session[:user_account_id] = @user_account.id
      redirect_to user_account_path(@user_account)
    else
      render :new
    end
  end

  def destroy
    session.clear
    redirect_to root_path
  end
end
