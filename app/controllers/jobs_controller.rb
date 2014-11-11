class JobsController < ApplicationController
  #before_action :initialize_calendar, only: [:edit, :update, :destroy]
  before_action :all_jobs, only: [:index, :create, :update, :destroy]
  before_action :set_job, only: [:edit, :update, :destroy]
  respond_to :html, :js

  # GET /jobs
  # GET /jobs.json
  def index
    # @jobs = Job.all
  end

  # GET /jobs/1
  # GET /jobs/1.json
  def show
  end

  # GET /jobs/new
  def new
    @job = Job.new(params.permit(:project_id, :ressource_id, :start_date, :end_date))
    # needed in new.js.erb
    @ressource_id = params[:ressource_id]
  end

  # GET /jobs/1/edit
  def edit
    @p = params[:department]
  end

  # POST /jobs
  # POST /jobs.json
  def create
    @job = Job.create(job_params.except(:department, :cal_start))
    initialize_calendar
  end

  # PATCH/PUT /jobs/1
  # PATCH/PUT /jobs/1.json
  def update
    @job.update_attributes(job_params.except(:department, :cal_start))
    initialize_calendar
  end

  # DELETE /jobs/1
  # DELETE /jobs/1.json
  def destroy
    @job.destroy
    initialize_calendar
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_job
      @job = Job.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def job_params
      params.require(:job).permit(:project_id, :ressource_id, :start_date, :end_date, :cal_start, :department)
    end

    def all_jobs
      @jobs = Job.all
    end

    def initialize_calendar
      @calendar = Calendar.new(job_params.permit(:department, :cal_start))
      @ressources = job_params[:department] ? Ressource.where(department: job_params[:department]) : Ressource.all.order('department')
    end
end
