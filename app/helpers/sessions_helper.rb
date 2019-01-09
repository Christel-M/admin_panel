module SessionsHelper

  def log_in(admin)
    session[:user_id] = admin.id
  end

  def current_admin
    if session[:user_id]
      @current_admin ||= User.find_by(id: session[:user_id])
    end
  end

  def logged_in?
    !session[:user_id].nil?
  end

end
