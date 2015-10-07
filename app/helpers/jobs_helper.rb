module JobsHelper
  def render_job_item(job)
    all_day_class = job.all_day == true ? 'all-day' : ''
    bg_color = Project.find_by_id(job.project_id).color
    content_tag :div, :class => "job #{all_day_class}", :style => "background:#{bg_color};" do
      link_to "", edit_job_path(job, :department => params[:department], :cal_start => params[:cal_start]), :title => truncate(job.short_info, :length => 32), remote: true
    end
  end
end
