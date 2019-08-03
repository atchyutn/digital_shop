class PurchaseController < ApplicationController
  before_action :authenticate_user!
  
  def cart
    render "checkout/cart"
  end
  
end
