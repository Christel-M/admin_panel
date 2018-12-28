class ApplicationController < ActionController::Base

  def current_user
    if session[:user_id]
      @current_user ||= Admin.find_all(session[:user_id])
    else
      @current_user = nil
      puts "Failed!!"
    end
  end

end
