class ClientsController < ApplicationController
  def index
    @clients = current_user.merchant.clients
  end

  def create
    @client = current_user.create_client(name: current_user.username)
    redirect_to user_account_path(@client.user_account)
  end
end
