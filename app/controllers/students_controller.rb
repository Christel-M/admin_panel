class StudentsController < ApplicationController
  def new
    @admin = Admin.find(params[:admin_id])
    @student = Student.new
  end

  def create
    @student = Student.new(st_params)

    if @student.valid?
      @student.save
      flash[:success] = "Student Created!"
      redirect_to admin_students_path
    else
      puts @student.errors.messages
      flash[:error] = "#{@student.errors.full_messages}"
      redirect_to new_admin_student_path
    end
  end

  def index
    @student = Student.all
  end

  def show
    @student = Student.find(params[:id])
  end

  def edit
    @admin = Admin.find(params[:admin_id])
    @student = Student.find(params[:id])
  end

  def update
    @student = Student.find(params[:id])

    if @student.update_attributes(st_params)
      flash[:success] = "Student Information Updated!"
      redirect_to admin_students_path
    else
      puts @student.errors
      flash[:error] = "#{@student.errors.full_messages}"
      redirect_to edit_admin_student_path
    end
  end

  def destroy
    @student = Student.find(params[:id])
    @student.destroy

    respond_to do |format|
      format.html
      format.js
    end

  end

  private

  def st_params
    params.require(:student).permit(:first_name, :last_name,
                                    :age, :education,:avatar,
                                    :email, :password)
  end

end
