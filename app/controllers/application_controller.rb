class ApplicationController < ActionController::Base
  # before_action :require_login

  def current_user
    if session[:user_id]
      @current_user ||= Admin.find(session[:user_id])
    else
      @current_user = nil
      puts "Failed!!"
    end
  end

end
