class ServicesController < ApplicationController
  def index
    if params[:merchant_id]
      @services = Merchant.find(params[:merchant_id]).services
    elsif params[:client_id]
      @services = Client.find(params[:client_id]).services
    else
      @services = Service.all
    end
  end

  def new
    @service = Service.new(merchant_id: params[:merchant_id])
  end

  def create
  end

  def show
    @service = Service.find(params[:id])
  end

  private

    def service_params
      params.require(:service).permit(:name, :description, :merchant_id, :client_id)
    end
end
