class AdminsController < ApplicationController
  def new
    @admin = Admin.new
  end

  def create
    @admin = Admin.new(admin_params)

    if @admin.valid?
      @admin.save
      redirect_to @admin
    else
      puts @admin.errors.messages
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
      redirect_to @admin
    else
      puts @admin.errors.messages
      render 'edit'
    end
  end

  def index
    @admin = Admin.all
  end

  def destroy
    @admin = nil
    puts "logged out!"
    redirect_to root_path
  end


  private

  def admin_params
    params.require(:admin).permit(:first_name, :last_name,
                                   :email, :password, :password_confirmation)
  end

end
