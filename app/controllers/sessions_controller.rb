class SessionsController < ApplicationController
  def new
  end

  def create
    user = Admin.find_by_email(params[:session][:email])

    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      redirect_to user
    else
      puts "failed!!"
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    puts "logged out!"
    redirect_to root_path

  end

end
