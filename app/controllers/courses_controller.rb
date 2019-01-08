class CoursesController < ApplicationController
  def new
    @admin = Admin.find(params[:admin_id])
    @course = Course.new
  end

  def create
    @course = Course.new(course_params)
    if @course.valid?
      @course.save
      flash[:success] = "Course Added!"
      redirect_to admin_courses_path
    else
      puts @course.errors.messages
      flash[:error] = "#{@course.errors.full_messages}"
      redirect_to new_admin_course_path
    end
  end

  def index
    @course = Course.all
  end

  def show
    @course = Course.find(params[:id])
  end

  def edit
    @admin = Admin.find(params[:admin_id])
    @course = Course.find(params[:id])
  end

  def update
    @course = Course.find(params[:id])

    if @course.update_attributes(course_params)
      flash[:success] = "Course Information Updated!"
      redirect_to admin_courses_path
    else
      puts @course.errors
      flash[:error] = "#{@course.errors.full_messages}"
      redirect_to edit_admin_course_path
    end
  end

  def destroy
    @course = Course.find(params[:id])
    @course.destroy

    respond_to do |format|
      format.html
      format.js
    end

  end

  private

  def course_params
    params.require(:course).permit(:name, :class_hours, :cohort_id)
  end

end
