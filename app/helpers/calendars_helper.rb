module CalendarsHelper

	def previous_week
		content_tag :li, :class => "pager pager-prev" do
			link_to "Prev", params.merge(:cal_start => (@calendar.first_day - 7).strftime("%Y-%m-%d")), :class => "btn btn-sm btn-default"
		end
	end

	def current_week
		content_tag :li, :class => "pager pager-current" do
			link_to "Now", params.merge(:cal_start =>  Date.today.beginning_of_week.strftime("%Y-%m-%d")), :class => "btn btn-sm btn-default"
		end
	end

	def next_week
		content_tag :li, :class => "pager pager-next" do
			link_to "Next", params.merge(:cal_start => @calendar.first_day.next_week.strftime("%Y-%m-%d")), :class => "btn btn-sm btn-default"
		end
	end

	def new_job(date, ressourceID)
		link_to '', new_job_path({:ressource_id => ressourceID, :start_date => date.strftime("%Y-%m-%d"), :end_date => date.strftime("%Y-%m-%d"), :department => params[:department], :cal_start => params[:cal_start]}), remote: true, :class => "new"
	end

	def projects_by_ressources
		@projects_by_ressources = []
		if params[:department] && params[:department] != 'pm'
			@projects_by_ressources.push(params[:department], 'allg')
		else
			@projects_by_ressources = Project.uniq.pluck(:department).map
		end
	end

end
