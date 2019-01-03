class InstructorsController < ApplicationController
  def new
    @admin = Admin.find(params[:admin_id])
    @instructor = Instructor.new
  end

  def create
    @instructor = Instructor.new(inst_params)

    if @instructor.valid?
      @instructor.save
      flash[:success] = "Instructor Added!"
      redirect_to admin_instructors_path
    else
      puts @instructor.errors.messages
      flash[:error] = "#{@instructor.errors.full_messages}"
      redirect_to new_admin_instructor_path
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
      flash[:success] = "Instructor Information Updated!"
      redirect_to admin_instructors_path
    else
      puts @instructor.errors
      flash[:error] = "#{@instructor.errors.full_messages}"
      redirect_to edit_admin_instructor_path
    end
  end

  def destroy
    @instructor = Instructor.find(params[:id])
    @instructor.destroy

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
