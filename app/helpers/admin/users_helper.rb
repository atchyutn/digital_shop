module Admin::UsersHelper
  def role_name(role)
    if role == '0'
      return 'Admin'
    elsif role == '1' 
      return 'User'
    end
  end
end
