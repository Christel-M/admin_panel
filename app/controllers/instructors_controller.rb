class InstructorsController < ApplicationController
  def new
    @instructor = Instructor.new
  end

  def create
    @instructor = Instructor.new(inst_params)

    if @instructor.valid?
      @instructor.save
      redirect_to @instructor
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
    @instructor = Instructor.find(params[:id])
  end

  def update
    @instructor = Instructor.find(params[:id])

    if @instructor.update_attributes(inst_params)
      redirect_to @instructor
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
