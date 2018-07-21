class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]

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
    @item = Item.new(item_params)
    if @item.save
      redirect_to merchant_item_path(@item.merchant, @item)
    else
      render :new
    end
  end

  def show
  end

  def update
  end

  private
    def set_item
      @item = Item.find(params[:id])
    end

    def item_params
      params.require(:item).permit(:name, :description, :merchant_id, :client_id)
    end
end
