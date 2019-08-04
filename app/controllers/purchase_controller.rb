class PurchaseController < ApplicationController
  before_action :authenticate_user!
  before_action :set_payment_token, only: [:complete]
  
  def cart
    if current_user.added_to_cart_items.present?
      redirect_to buy_complete_path(token: create_payment_token.token)
    else
      redirect_to root_path
    end
  end
  
  def complete
    render "checkout/index"
  end
  
  private
    def create_payment_token
      payment_token = PaymentToken.create(
        token: "#{SecureRandom.hex(16)}#{Time.now.to_i}",
        user_id: current_user.id
      )
      Tax.active.each do |tax|
        payment_token.payment_token_taxes.create(tax: tax)        
      end
      payment_token
    end
    
    def set_payment_token
      @payment_token = PaymentToken.find_by(token: params[:token]) unless params[:token].blank?
    end
  
end
