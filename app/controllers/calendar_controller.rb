class CalendarController < ApplicationController
	def calendar_view
		@today = Date.today 
		@start_date = @today.beginning_of_week
		@week_end = @start_date + 27
		@week_number = @today.strftime("%U").to_i
		@date_range = (@start_date..@week_end)
    @ressources = Ressource.all
	end
	# def render(block)
 #      @block = block

 #      capture do
 #        concat render_weeks
 #      end
 #    end

	# def render_weeks
 #      capture do
 #        @date_range.each_slice(7) do |week|
 #          concat content_tag( :ul, week)
 #        end
 #      end
 #    end

    # def render_week(week)
    # 	results = week.map do |day|
    #     	content_tag ( :li, day)
    # 	end
    #     safe_join results
    # end
end
