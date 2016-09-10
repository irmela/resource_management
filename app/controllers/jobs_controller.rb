class JobsController < ApplicationController
  before_action :authenticate_user!
  before_action :all_jobs, only: [:index, :create, :update]
  before_action :set_job, only: [:edit, :update, :destroy]
  before_filter :set_paper_trail_whodunnit
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
    @job = Job.new(params.permit(:project_id, :resource_id, :start_date, :end_date, :description, :all_day, :schedule))
    # needed in new.js.erb
    @resource_id = params[:resource_id]
  end

  # GET /jobs/1/edit
  def edit
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
    @calendar = Calendar.new(params.permit(:department, :cal_start))
    @resources = params[:department] ? Resource.with_department(params[:department]) : Resource.ordered_by_department
    @job.destroy
  end

  def history
    @versions = PaperTrail::Version.where(:item_type => 'Job').order(:created_at => :desc)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_job
      @job = Job.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def job_params
      params.require(:job).permit(:project_id, :resource_id, :start_date, :end_date, :description, :cal_start, :department, :all_day, :schedule)
    end

    def all_jobs
      @jobs = Job.all
    end

    def initialize_calendar
      @calendar = Calendar.new(params.permit(:department, :cal_start))
      @resources = job_params[:department] != '' ? Resource.with_department(job_params[:department]) : Resource.ordered_by_department
    end
end
