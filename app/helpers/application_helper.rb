module ApplicationHelper
  def flash_class(level)
    case level
        when 'notice' then "alert alert-info"
        when 'success' then "alert alert-success"
        when 'error' then "alert alert-danger"
        when 'alert' then "alert alert-danger"
    end
  end
  
  def get_cart_items_count
    if current_user
      current_user.added_to_cart_items.count
    else
      (session[:cart_items] || []).size
    end
  end
end
