module ApplicationHelper
  # All methods placed here are automatically called as helper methods.
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
end
