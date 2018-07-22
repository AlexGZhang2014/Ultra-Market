class MerchantsController < ApplicationController
  def index
    @merchants = Merchant.all
  end

  def create
    @merchant = current_user.create_merchant(name: current_user.username)
    #current_user.save
    redirect_to user_account_path(@merchant.user_account)
  end

end
