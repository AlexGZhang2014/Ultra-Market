class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :update, :destroy]

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
    if params[:merchant_id] && !Merchant.exists?(params[:merchant_id])
      redirect_to merchants_path, alert: "Merchant not found."
    else
      @item = Item.new(merchant_id: params[:merchant_id])
    end
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

  def edit
    if params[:merchant_id]
      merchant = Merchant.find_by(id: params[:merchant_id])
      if merchant.nil?
        redirect_to merchants_path, alert: "Merchant not found."
      else
        @item = merchant.items.find_by(id: params[:id])
        redirect_to merchant_items_path(merchant), alert: "Item not found." if @item.nil?
      end
    else
      @item = Item.find(params[:id])
    end
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
