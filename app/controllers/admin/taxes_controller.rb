class Admin::TaxesController < Admin::BaseController
  # before actions
  before_action :find_tax, only: [:edit, :update, :destroy]
  
  # get all the taxes list
  def index
    @taxes = Tax.all
  end
  
  # new tax form render
  def new
    @tax = Tax.new
  end
  
  # tax edit form render
  def edit
  end
  
  # tax creation and handling failure
  def create
    @tax = Tax.new(tax_params)
    if @tax.save
      redirect_to admin_taxes_path
        flash[:success] = "Woohoo! tax created successfully."
    else
      render 'new'
      flash[:error] = "Oops! Something went wrong!"
    end
  end
  
  # tax updation and handling failure
  def update
    if @tax.update(tax_params)
      redirect_to admin_taxes_path
        flash[:success] = "Woohoo! tax updated successfully."
    else
      render 'edit'
      flash[:error] = "Oops! Something went wrong!"
    end
  end
  
  # destory the tax
  def destroy
    @tax.destroy
    redirect_to admin_taxes_path
  end
  
  private
  
  # get the tax form params
  def find_tax
    @tax = Tax.find_by(id: params[:id])
  end
  
  # tax permit params
  def tax_params
    params.require(:tax).permit(:name, :tax_type, :status, :amount)
  end
end
  