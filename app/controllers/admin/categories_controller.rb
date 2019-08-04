class Admin::CategoriesController < Admin::BaseController
# before actions
before_action :find_category, only: [:edit, :show, :update, :destroy]

# get all the categories list
def index
  @categories = Category.all
end

# display category details
def show
end

# new category form render
def new
  @category = Category.new
end

# category edit form render
def edit
end

# category creation and handling failure
def create
  @category = Category.new(category_params)
  if @category.save
    redirect_to admin_categories_path
  else
    render 'new'
  end
end

# category updation and handling failure
def update
  if @category.update(category_params)
    redirect_to admin_categories_path
  else
    render 'edit'
  end
end

# destory the category
def destroy
  @category.destroy
  redirect_to admin_categories_path
end

private

# get the category form params
def find_category
  @category = Category.find_by(id: params[:id])
end

# category permit params
def category_params
  params.require(:category).permit(:name, :created_by, :updated_by)
end
end
