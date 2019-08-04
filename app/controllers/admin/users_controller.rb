class Admin::UsersController < Admin::BaseController
  # before actions for user controller
  before_action :find_user, only: [:edit, :update, :destroy]

  # display all users
  def index
    @users = User.all.order(:created_at)
  end

  # edit specific user
  def edit
  end

  # update specific user
  def update
    if @user.update(user_params)
      flash[:success] = "Woohoo! User updated successfully."
      redirect_to admin_users_path
    else
      render 'edit'
      flash[:error] = "Oops! Something went wrong!"
    end
  end

  # delete specific user from database
  def destroy
    @user.destroy
    flash[:success] = "#{@user}deleted successfully!"
    redirect_to admin_users_path
  end

  private

  # find user from id
  def find_user
    @user = User.find_by(id: params[:id])
  end

  # user params for user updation
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :role)
  end
end
