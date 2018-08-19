class ServicesController < ApplicationController
  before_action :set_service, only: [:show, :update, :destroy, :buy, :complete]

  def index
    if !params[:date].blank?
      if params[:date] == "Most Recent"
        redirect_to controller: "services", action: "most_recent"
      else
        redirect_to controller: "services", action: "oldest"
      end
    else
      if params[:merchant_id]
        @services = Merchant.find(params[:merchant_id]).services.available
        respond_to do |format|
          format.html { render :index }
          format.json { render json: @services }
        end
      elsif params[:client_id]
        @services = Client.find(params[:client_id]).services
      else
        @services = Service.available
        respond_to do |format|
          format.html { render :index }
          format.json { render json: @services }
        end
      end
    end
  end

  def most_recent
    @services = Service.most_recent.available
  end

  def oldest
    @services = Service.oldest.available
  end

  def new
    if params[:merchant_id] && !Merchant.exists?(params[:merchant_id])
      redirect_to merchants_path, notice: "Merchant not found."
    else
      @service = Service.new(merchant_id: params[:merchant_id])
    end
  end

  def create
    @service = Service.new(service_params)
    if @service.save
      respond_to do |format|
        format.html { redirect_to merchant_service_path(@service.merchant, @service) }
        format.json { render json: @service, status: 201 }
      end
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
        redirect_to merchants_path, notice: "Merchant not found."
      else
        @service = merchant.services.find_by(id: params[:id])
        redirect_to merchant_services_path(merchant), notice: "Service not found." if @service.nil?
      end
    else
      @service = Service.find(params[:id])
    end
  end

  def update
    @service.update(service_params)
    if @service.save
      redirect_to merchant_service_path(@service.merchant, @service)
    else
      render :edit
    end
  end

  def destroy
    @service.destroy
    flash[:notice] = "Service deleted."
    redirect_to merchant_services_path(current_user.merchant)
  end

  def buy
    if !@service.bought
      @service.update(client: current_user.client, bought: true)
      flash[:notice] = "Service has been successfully purchased."
      redirect_to client_services_path(current_user.client)
    else
      @service.update(completed: true)
      flash[:notice] = "Service is now completed!"
      redirect_to client_service_path(@service.client, @service)
    end
  end

  private
    def set_service
      @service = Service.find(params[:id])
    end

    def service_params
      params.require(:service).permit(:name, :description, :bought, :completed, :merchant_id, :client_id)
    end
end
