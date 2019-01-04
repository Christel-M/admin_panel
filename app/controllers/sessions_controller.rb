class SessionsController < ApplicationController
  def new
    admin = Admin.new
  end

  def create
    admin = Admin.find_by_email(params[:session][:email])

    if admin && admin.authenticate(params[:session][:password])
      flash[:success] = "Welcome #{admin.first_name}"
      session[:user_id] = admin.id
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
    # flash[:notice] = "Good Bye!"
    redirect_to login_path

  end

end
