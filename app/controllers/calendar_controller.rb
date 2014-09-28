class CalendarController < ApplicationController
	def calendar_view
		@today = Date.today 
		@start_date = @today.beginning_of_week
		@week_end = @start_date + 41
		@week_number = @today.strftime("%U").to_i
		@date_range = (@start_date..@week_end)
    @ressources = Ressource.all
	end
end
