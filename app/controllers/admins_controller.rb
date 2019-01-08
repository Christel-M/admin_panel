class AdminsController < ApplicationController
  def new
    @admin = Admin.new
  end

  def create
    @admin = Admin.new(admin_params)

    if @admin.valid?
      @admin.save
      flash[:success] = "Account Successfully Created! Welcome #{@admin.first_name}"
      redirect_to @admin
    else
      puts @admin.errors.messages
      # flash[:error] = "Please Try Again"
      render 'new'
    end
  end

  def show
    @admin = Admin.find(params[:id])
  end

  def edit
    @admin = Admin.find(params[:id])
  end

  def update
    @admin = Admin.find(params[:id])

    if @admin.update_attributes(admin_params)
      flash[:success] = "Account Updated"
      redirect_to @admin
    else
      puts @admin.errors.messages
      flash[:error] = "Error. Please try again"
      render 'edit'
    end
  end

  def index
    @admin = Admin.all
    redirect_to root_path
  end

  private

  def admin_params
    params.require(:admin).permit(:first_name, :last_name,
                                   :email, :password, :password_confirmation, :avatar)
  end

end
