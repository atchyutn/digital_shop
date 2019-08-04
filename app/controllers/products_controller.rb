class ProductsController < ApplicationController

  # before actions
  before_action :find_product, only: [:show]

  # get all the products list
  def index
    @products = Product.all
  end

  # display product details
  def show
  end
  
  private

  # get the product form params
  def find_product
    @product = Product.find_by(id: params[:id])
  end
end
