class JobsController < ApplicationController
  before_action :set_job, only: [:show, :edit, :update, :destroy]
  before_action :all_jobs, only: [:index, :create, :calendar, :update]
  respond_to :html, :js

  def calendar
    @today = Date.today 
    @start_date = @today.beginning_of_week
    @week_end = @start_date + 41
    @week_number = @today.strftime("%U").to_i
    @ressources = Ressource.all
    @projects = Project.all
    $date_range = (@start_date..@week_end)
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
    @table = view_context.render_table
  end

  # PATCH/PUT /jobs/1
  # PATCH/PUT /jobs/1.json
  def update
    @job.update_attributes(job_params)
    # needed in update.js.erb
    @table = view_context.render_table
  end

  # DELETE /jobs/1
  # DELETE /jobs/1.json
  def destroy
    @job.destroy
    respond_to do |format|
      format.html { redirect_to jobs_url, notice: 'Job was successfully destroyed.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_job
      @job = Job.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def job_params
      params.require(:job).permit(:project_id, :ressource_id, :start_date, :end_date)
    end

    def all_jobs
      @jobs = Job.all
    end
end
