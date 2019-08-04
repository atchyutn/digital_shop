class CartsController < ApplicationController
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
    render json: {message: "#{@product.id} has been added to cart successfully.", status: true}
  end
  
  def remove
    unless @product
      render json: {message: "Product not found"}, status: :unprocessable_entity 
      return
    end
    if user_signed_in?
      current_user.remove_from_cart(@product)
    else
      session[:cart_items].delete(@product.id)
    end
    render json: {message: "#{@product.id} has been added to cart successfully.", status: true}
  end
  
  private
    def set_product
      @product = Product.find_by_id(params[:product]) unless params[:product].blank?
    end
    
    def intialize_cart
      session[:cart_items] = [] unless session[:cart_items]
    end
end
