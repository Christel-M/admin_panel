class CohortsController < ApplicationController
  def new
    @admin = Admin.find(params[:admin_id])
    @cohort = Cohort.new
  end

  def create
    @cohort = Cohort.new(cohort_params)
    if @cohort.valid?
      @cohort.save
      redirect_to admin_cohort_path(id: @cohort.id)
    else
      puts "Error: #{@cohort.errors.messages}"
      render 'new'
    end
  end

  def edit
    @admin = Admin.find(params[:admin_id])
    @cohort = Cohort.find(params[:id])
  end

  def index
    @cohort = Cohort.all
  end

  def show
    @cohort = Cohort.find(params[:id])
  end

  def update
    @cohort = Cohort.find(params[:id])
    if @cohort.update_attributes(cohort_params)
      redirect_to admin_cohort_path(id: @cohort.id)
    else
      puts @cohort.errors.messages
      render 'edit'
    end
  end

  private

  def cohort_params
    params.require(:cohort).permit(:name,
                                   :start_date, :end_date,
                                   :instructor_id,
                                   :course_id,
                                   student_ids:[])
  end

end
