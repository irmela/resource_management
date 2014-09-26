module CalendarHelper

	def render_weeks
        @date_range.each_slice(7).each do |week|
        	label = content_tag( :span, "KW " + week[1].cweek.to_s)
			week = content_tag( :ul, render_week(week), :class => "week")
			concat content_tag( :div, label.to_s + week.to_s, :class => "week-container")
        end
    end

    def render_week(week)
    	results = week.map do |day|
        	content_tag( :li, jobs_by_date(day), :class => "day", :id => day)
    	end
        safe_join results
    end

    def jobs_by_date(date)
    	# results = week.map do |day|
     #    	content_tag( :li, day.day, :class => "day", :id => day)
    	# end
     #    safe_join results

     	# return date.day
     	return Job.first.project_id if date.between?(Job.first.start_date, Job.first.end_date)
    end

    # def render_week(week)
    #   results = week.map do |day|
    #     content_tag :td, get_option(:td, start_date, day) do
    #       #block.call(day, events_for_date(day))
    #     end
    #   end
    #   safe_join results
    # end
end
