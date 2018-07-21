module ItemsHelper
  def client_view
    current_user.client && current_user.username != @item.merchant.name
  end

  def merchant_view
    current_user.merchant && current_user.username == @item.merchant.name
  end
end
