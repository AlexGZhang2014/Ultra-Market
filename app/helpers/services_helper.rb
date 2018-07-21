module ServicesHelper
  def service_client_view
    current_user.client && current_user.username != @service.merchant.name
  end

  def service_merchant_view
    current_user.merchant && current_user.username == @service.merchant.name
  end
end
