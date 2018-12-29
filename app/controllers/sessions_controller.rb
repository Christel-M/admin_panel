class SessionsController < ApplicationController
  def new
  end

  def create
    user = Admin.find_by_email(params[:session][:email])

    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      # flash[:success] = "Welcome #{user.first_name}"
      redirect_to user
    else
      puts "failed!!"
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    flash.now[:notice] = "Incorrect email address or password. Please try again"
    puts "logged out!"
    redirect_to root_path

  end

end
