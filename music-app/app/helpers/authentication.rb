helpers do
  
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  
  def is_logged_in?
    !!current_user
  end
  
  def authorize!
    unless is_logged_in?
      flash[:danger] = "you must log in to view this page"
      redirect '/login'
    end
  end        
end