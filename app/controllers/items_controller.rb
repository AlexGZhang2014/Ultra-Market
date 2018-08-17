class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :update, :destroy, :buy]

  def index
    if !params[:date].blank?
      if params[:date] == "Most Recent"
        redirect_to controller: "items", action: "most_recent"
      else
        redirect_to controller: "items", action: "oldest"
      end
    else
      if params[:merchant_id]
        @items = Merchant.find(params[:merchant_id]).items.available
        respond_to do |format|
          format.html { render :index }
          format.json { render json: @items }
        end
      elsif params[:client_id]
        @items = Client.find(params[:client_id]).items
      else
        @items = Item.available
        respond_to do |format|
          format.html { render :index }
          format.json { render json: @items }
        end
      end
    end
  end

  def most_recent
    @items = Item.most_recent.available
  end

  def oldest
    @items = Item.oldest.available
  end

  def new
    if params[:merchant_id] && !Merchant.exists?(params[:merchant_id])
      redirect_to merchants_path, notice: "Merchant not found."
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
    respond_to do |format|
      format.html { render :show }
      format.json { render json: @item }
    end
  end

  def edit
    if params[:merchant_id]
      merchant = Merchant.find_by(id: params[:merchant_id])
      if merchant.nil?
        redirect_to merchants_path, notice: "Merchant not found."
      else
        @item = merchant.items.find_by(id: params[:id])
        redirect_to merchant_items_path(merchant), notice: "Item not found." if @item.nil?
      end
    else
      @item = Item.find(params[:id])
    end
  end

  def update
    @item.update(item_params)
    if @item.save
      redirect_to merchant_item_path(@item.merchant, @item)
    else
      render :edit
    end
  end

  def destroy
    @item.destroy
    flash[:notice] = "Item deleted."
    redirect_to merchant_items_path(current_user.merchant)
  end

  def buy
    @item.update(client: current_user.client, bought: true)
    flash[:notice] = "Item has been successfully purchased."
    redirect_to client_items_path(current_user.client)
  end

  private
    def set_item
      @item = Item.find(params[:id])
    end

    def item_params
      params.require(:item).permit(:name, :description, :bought, :merchant_id, :client_id)
    end
end
