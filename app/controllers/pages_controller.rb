class PagesController < ApplicationController

  def home
    user = Admin.find_by(params[:session])
    if session[:user_id]
        user ||= Admin.find_all(session[:user_id])
      else
        user = nil
        redirect_to login_path
        puts "Failed!!"
      end
  end

end
