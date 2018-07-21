class ServicesController < ApplicationController
  before_action :set_service, only: [:show, :update, :destroy]

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
    if params[:merchant_id] && !Merchant.exists?(params[:merchant_id])
      redirect_to merchants_path, alert: "Merchant not found."
    else
      @service = Service.new(merchant_id: params[:merchant_id])
    end
  end

  def create
    @service = Service.new(service_params)
    if @service.save
      redirect_to merchant_service_path(@service.merchant, @service)
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
        @service = merchant.services.find_by(id: params[:id])
        redirect_to merchant_services_path(merchant), alert: "Service not found." if @service.nil?
      end
    else
      @service = Service.find(params[:id])
    end
  end

  def update
  end

  private
    def set_service
      @service = Service.find(params[:id])
    end

    def service_params
      params.require(:service).permit(:name, :description, :merchant_id, :client_id)
    end
end
