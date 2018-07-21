class ItemsController < ApplicationController
  def index
    if params[:merchant_id]
      @items = Merchant.find(params[:merchant_id]).items
    elsif params[:client_id]
      @items = Client.find(params[:client_id]).items
    else
      @items = Item.all
    end
  end

  def new
    @item = Item.new(merchant_id: params[:merchant_id])
  end

  def create
  end

  def show
    @item = Item.find(params[:id])
  end

  private

    def item_params
      params.require(:item).permit(:name, :description, :merchant_id, :client_id)
    end
end
