class JobsController < ApplicationController
  before_action :all_jobs, only: [:index, :create, :update, :destroy]
  before_action :set_job, only: [:edit, :update, :destroy]
  respond_to :html, :js

  def calendar
    @week_start = params[:cal_start] ? DateTime.parse(params[:cal_start]).beginning_of_week : Date.today.beginning_of_week
    week_end = @week_start + 41
    $date_range = (@week_start..week_end)
    $ressources = params[:department] ? Ressource.where(department: params[:department]) : Ressource.all.order('department')
    @ressource_departments = Ressource.uniq.pluck(:department).sort
    @projects = Project.all
  end

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
  end

  # POST /jobs
  # POST /jobs.json
  def create
    @job = Job.create(job_params)
    # needed in new.js.erb
    @table = view_context.render_table($ressources)
  end

  # PATCH/PUT /jobs/1
  # PATCH/PUT /jobs/1.json
  def update
    @job.update_attributes(job_params)
    # needed in update.js.erb
    @table = view_context.render_table($ressources)
  end

  # DELETE /jobs/1
  # DELETE /jobs/1.json
  def destroy
    @job.destroy
    # needed in update.js.erb
    @table = view_context.render_table($ressources)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_job
      @job = Job.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def job_params
      params.require(:job).permit(:project_id, :ressource_id, :start_date, :end_date, :cal_start)
    end

    def all_jobs
      @jobs = Job.all
    end
end
