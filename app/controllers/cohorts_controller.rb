class CohortsController < ApplicationController
  def new
    @admin = Admin.find(params[:admin_id])
    @cohort = Cohort.new
  end

  def create
    @cohort = Cohort.new(cohort_params)
    if @cohort.valid?
      @cohort.save
      flash[:success] = "Cohort Created!"
      redirect_to admin_cohorts_path
    else
      puts "Error: #{@cohort.errors.messages}"
      flash[:error] = "#{@cohort.errors.full_messages}"
      redirect_to new_admin_cohort_path
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
    if @cohort.update(cohort_params)
      flash[:notice] = "Cohort Information Updated!"
      redirect_to admin_cohorts_path
    else
      puts @cohort.errors.messages
      flash[:error] = "#{@cohort.errors.full_messages}"
      redirect_to edit_admin_cohort_path
    end
  end

  def destroy
    @cohort = Cohort.find(params[:id])
    @cohort.destroy

    respond_to do |format|
      format.html
      format.js
    end

    redirect_to admin_cohorts_path

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
