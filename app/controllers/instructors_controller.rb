class InstructorsController < ApplicationController
  def new
    @admin = Admin.find(params[:admin_id])
    @instructor = Instructor.new
  end

  def create
    # @admin = Admin.find(params[:admin_id])
    @instructor = Instructor.new(inst_params)

    if @instructor.valid?
      # @instructor.admin_id = params[:admin_id]
      @instructor.save
      redirect_to admin_instructor_path(id: @instructor.id)
    else
      puts @instructor.errors.messages
      render 'new'
    end
  end

  def index
    @instructor = Instructor.all
  end

  def show
    @instructor = Instructor.find(params[:id])
  end

  def edit
    @admin = Admin.find(params[:admin_id])
    @instructor = Instructor.find(params[:id])
  end

  def update
    @instructor = Instructor.find(params[:id])

    if @instructor.update_attributes(inst_params)
      redirect_to admin_instructor_path(id: @instructor.id)
    else
      puts @instructor.errors
      render 'edit'
    end
  end

  private

  def inst_params
    params.require(:instructor).permit(:first_name, :last_name,
                                    :age, :salary,
                                    :education,
                                    :email, :password,
                                    :cohort_id)
  end

end
