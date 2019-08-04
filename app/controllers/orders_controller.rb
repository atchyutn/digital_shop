class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_purchase, only: [:show, :resend_order_conformation]
  
  def index
    
  end
  
  def show
    
  end
  
  def resend_payment_conformation
    
  end
  
  private
    def set_purchase
      @purchase = Purchase.find_by(id: params[:id])
    end
end