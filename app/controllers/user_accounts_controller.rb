class UserAccountsController < ApplicationController
  before_action :set_user, only: [:show]

  def new
    @user_account = UserAccount.new
  end

  def create
    @user_account = UserAccount.new(user_params)
    if @user_account.save
      session[:user_account_id] = @user_account.id
      redirect_to user_account_path(@user_account)
    else
      render :new
    end
  end

  def show
    @merchant = current_user.merchant
    
  end

  private

    def user_params
      params.require(:user_account).permit(:username, :email, :password)
    end

    def set_user
      @user_account = UserAccount.find(params[:id])
    end
end
