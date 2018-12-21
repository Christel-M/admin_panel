class CohortsController < ApplicationController
  def new
    @cohort = Cohort.new
  end

  def create
    @cohort = Cohort.new(cohort_params)
    if @cohort.valid?
      @cohort.save
      redirect_to @cohort
    else
      puts "Error: #{@cohort.errors.messages}"
      render 'new'
    end
  end

  def edit
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
