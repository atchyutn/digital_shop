class Admin::BaseController < ApplicationController
  protect_from_forgery with: :exception

  before_action :authenticate_user! && :authorize_admin!

  private

  def authorize_admin!
    return if current_user.role == '0' 
    flash[:alert] = 'Login as Admin to access this page!'
    redirect_to root_path
  end

end
