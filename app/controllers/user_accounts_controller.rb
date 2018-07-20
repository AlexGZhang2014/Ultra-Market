class UserAccountsController < ApplicationController
  def new
    @user_account = UserAccount.new
  end

  def create
    @user_account = UserAccount.new(user_params)
    if @user_account.save
      redirect_to user_account_path(@user_account)
    else
      render :new
    end
  end

  private

    def user_params
      params.require(:user_account).permit(:username, :email, :password)
    end
end
