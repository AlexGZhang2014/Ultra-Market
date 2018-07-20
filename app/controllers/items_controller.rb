class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def new
  end

  def create
  end

  def show
  end

  private

    def item_params
      params.require(:item).permit(:name, :description)
    end
end
