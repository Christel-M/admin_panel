class CoursesController < ApplicationController
  def new
    @course = Course.new
  end

  def create
    @course = Course.new(course_params)
    if @course.valid?
      @course.save
      redirect_to @course
    else
      puts @course.errors.messages
      render 'new'
    end
  end

  def index
    @course = Course.all
  end

  def show
    @course = Course.find(params[:id])
  end

  def edit
    @course = Course.find(params[:id])
  end

  def update
    @course = Course.find(params[:id])

    if @course.update_attributes(course_params)
      redirect_to @course
    else
      puts @course.errors
      render 'edit'
    end
  end

  private

  def course_params
    params.require(:course).permit(:name, :class_hours, :cohort_id)
  end

end
