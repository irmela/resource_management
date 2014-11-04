module CalendarsHelper

	def previous_week
        content_tag :li, :class => "pager pager-prev" do
            link_to "Prev", params.merge(:cal_start => ($calendar.first_day - 7).strftime("%Y-%m-%d")), :class => "btn btn-sm btn-default"
        end
    end

    def current_week
        content_tag :li, :class => "pager pager-current" do
            link_to "Now", params.merge(:cal_start =>  Date.today.beginning_of_week.strftime("%Y-%m-%d")), :class => "btn btn-sm btn-default"
        end
    end

    def next_week
        content_tag :li, :class => "pager pager-next" do
            link_to "Next", params.merge(:cal_start => $calendar.first_day.next_week.strftime("%Y-%m-%d")), :class => "btn btn-sm btn-default"
        end
    end

	def new_job(date, ressourceID)
		link_to '', new_job_path({:ressource_id => ressourceID, :start_date => date.strftime("%Y-%m-%d"), :end_date => date.strftime("%Y-%m-%d")}), remote: true, :class => "new"
	end

	def jobs_by_date(date, ressourceID)
		@jobs = Job.all
	    @jobs.each do |job|
	     	if date.between?(job.start_date, job.end_date) && ressourceID == job.ressource_id
	     		projectID = job.project_id
	     		projectColor = Project.find_by_id(projectID).color
                editLink = link_to '', edit_job_path(job), remote: true
	     		concat content_tag( :div, editLink.to_s, :style => "background: #{projectColor};", :class => "job")
	    	end
	    end
    end
end
