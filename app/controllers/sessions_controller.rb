class SessionsController < ApplicationController
  def new
  end

  def create
    user = Admin.find_by_email(params[:session][:email])

    if user && user.authenticate(params[:session][:password])
      flash[:success] = "Welcome #{user.first_name}"
      session[:user_id] = user.id
      redirect_to root_path
    else
      flash[:error] = "Incorrect email address or password. Please try again"
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
