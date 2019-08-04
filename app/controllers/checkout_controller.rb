require "twilio_authy"

class CheckoutController < ApplicationController
  before_action :authenticate_user!
  before_action :set_payment_token, only: [:complete, :request_twof_authentication, :verify_authentication]
  before_action :check_for_cart_items, only: [:cart, :complete]
  
  def cart
    redirect_to checkout_complete_path(token: create_payment_token.token)
  end
  
  def product
    redirect_to checkout_complete_path(token: create_payment_token(params[:product_id]).token)
  end
  
  def complete
    render "checkout/index"
  end
  
  def request_twof_authentication
    send_sms = TwilioAuthy.new(user: @payment_token.user).request_sms
    if send_sms == true
      render "checkout/confirm_payment"
    else
      @errors = send_sms
      render "checkout/error"
    end
  end
  
  def verify_authentication
    if @payment_token
      verification = TwilioAuthy.new(user: @payment_token.user).verify_user(params[:verification_code])
      if verification == true
        @order = @payment_token.change_payment_status("success")
        render "checkout/order_placed"
      else
        @errors = verification
        @payment_token.change_payment_status("failed")
        render "checkout/error"
      end
    else
      @errors = "Payment token not found"
      render "checkout/error"
    end
  end
  
  private
    def create_payment_token(product_id = nil)
      payment_token = PaymentToken.create(
        token:      "#{SecureRandom.hex(16)}#{Time.now.to_i}",
        user_id:    current_user.id,
        product_id: product_id
      )
      Tax.active.each do |tax|
        payment_token.payment_token_taxes.create(tax: tax)        
      end
      payment_token
    end
    
    def set_payment_token
      @payment_token = PaymentToken.find_by(token: params[:token]) unless params[:token].blank?
    end
    
    def check_for_cart_items
      redirect_to root_path unless current_user.added_to_cart_items.present? || @payment_token.product
    end
  
end
