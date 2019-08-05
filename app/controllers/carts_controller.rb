class CartsController < ApplicationController
  include ApplicationHelper
  
  before_action :set_product
  before_action :intialize_cart
  
  def add
    unless @product
      render json: {message: "Product not found"}, status: :unprocessable_entity 
      return
    end
    if user_signed_in?
      current_user.add_to_cart(@product)
    else
      session[:cart_items] << @product.id unless session[:cart_items].include?(@product.id)
    end
    render json: {message: "#{@product.name} has been added to cart successfully.", added_items_count: get_cart_items_count}, status: :ok
  end
  
  def remove
    unless @product
      render json: {message: "Product not found"}, status: :unprocessable_entity 
      return
    end
    @payment_token = PaymentToken.find_by(token: params[:token])
    if user_signed_in?
      current_user.remove_from_cart(@product)
    else
      session[:cart_items].delete(@product.id)
    end
    render json: {
      message: "#{@product.name} has been removed from cart successfully.", 
      added_items_count: get_cart_items_count,
      cart_items: render_to_string(partial: "checkout/cart_items", locals: {cart_items: current_user.added_to_cart_items}),
    payment_details: render_to_string(partial: "checkout/prices_info", locals: {payment_token: @payment_token})
    }, status: :ok
  end
  
  private
    def set_product
      @product = Product.find_by_id(params[:product]) unless params[:product].blank?
    end
    
    def intialize_cart
      session[:cart_items] = [] unless session[:cart_items]
    end
end
