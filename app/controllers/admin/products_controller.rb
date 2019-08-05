class Admin::ProductsController < Admin::BaseController

# before actions
before_action :find_product, only: [:edit, :show, :update, :destroy]

  # get all the products list
  def index
    @products = Product.all
  end

  # display product details
  def show
  end
  
  # new product form render
  def new
    @product = Product.new
  end

  # product edit form render
  def edit
  end

  # product creation and handling failure
  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to admin_products_path
      flash[:success] = "Woohoo! product created successfully."
    else
      render 'new'
      flash[:error] = "Oops! Something went wrong!"
    end
  end

  # product updation and handling failure
  def update
    if @product.update(product_params)
      redirect_to admin_products_path
      flash[:success] = "Woohoo! product updated successfully."
    else
      render 'edit'
      flash[:error] = "Oops! Something went wrong!"
    end
  end

  # destory the product
  def destroy
    @product.destroy
    redirect_to admin_products_path
  end

  private

  # get the product form params
  def find_product
    @product = Product.find_by(id: params[:id])
  end

  # product permit params
  def product_params
    params.require(:product).permit(:name, :description, :category_id, :price, :offer_price, :status, :created_by)
  end
end
