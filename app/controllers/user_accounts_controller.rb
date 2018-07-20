class UserAccountsController < ApplicationController
  def new
    @user_account = UserAccount.new
  end

  def create
  end
end
