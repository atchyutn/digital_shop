class Custom::RegistrationsController < Devise::RegistrationsController
  def create
    super
    current_user.sync_cart_items(session[:cart_items]) if current_user.present?
    session[:cart_items] = []
  end
end
