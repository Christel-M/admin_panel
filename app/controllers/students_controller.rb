class StudentsController < ApplicationController
  def new
    @student = Student.new
  end

  def create
    @student = Student.new(st_params)

    if @student.valid?
      @student.save
      redirect_to @student
    else
      puts @student.errors.messages
      render 'new'
    end
  end

  def index
    @student = Student.all
  end

  def show
    @student = Student.find(params[:id])
  end

  def edit
    @student = Student.find(params[:id])
  end

  def update
    @student = Student.find(params[:id])

    if @student.update_attributes(st_params)
      redirect_to @student
    else
      puts @student.errors
      render 'edit'
    end
  end

  #don't forget to create destroy!

  private

  def st_params
    params.require(:student).permit(:first_name, :last_name,
                                    :age, :education,
                                    :email, :password)
  end

end
