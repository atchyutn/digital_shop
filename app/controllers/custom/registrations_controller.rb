class Custom::RegistrationsController < Devise::RegistrationsController
  def create
    super
    current_user.sync_cart_items(session[:cart_items])
    session[:cart_items] = []
  end
end
