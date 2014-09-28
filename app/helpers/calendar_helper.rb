module CalendarHelper

	def render_table
		content_tag :table, :class => "table" do
        	concat content_tag( :thead, render_table_head)
			concat content_tag( :tbody, render_ressources)
		end
    end

    def render_table_head
		content_tag :tr do
			concat content_tag( :th, "Ressource")
			results = @date_range.each_slice(7).map do |week|
				concat content_tag( :th, "KW " + week[1].cweek.to_s)
	        end
	        safe_join results
	    end
    end

    def render_ressources
    	results = Ressource.all.map do |ressource|
    		render_weeks(ressource.name, ressource.id)
    	end
    	safe_join results
    end

	def render_weeks(ressource, ressourceID)
        content_tag :tr do
            concat content_tag( :td, ressource)
            results = @date_range.each_slice(7).map do |week|
    			concat content_tag( :td, render_week(week, ressourceID), :class => "week")
            end
            safe_join results
        end
    end

    def render_week(week, ressourceID)
    	results = week.map do |day|
        	content_tag( :div, jobs_by_date(day, ressourceID), :class => "day", :id => day)
    	end
        safe_join results
    end

    def jobs_by_date(date, ressourceID)
	    results = Job.all.map do |job|
	     	if date.between?(job.start_date, job.end_date) && ressourceID == job.ressource_id
	     		projectID = job.project_id
	     		projectColor = Project.find_by_id(projectID).color
	     		content_tag( :div, date.day, :style => "background: #{projectColor};")
	    	end
	    end
	    safe_join results
    end
end
