class Calendar
	
	def initialize(params = {})
		@week_start = params[:cal_start] ? DateTime.parse(params[:cal_start]).beginning_of_week : Date.today.beginning_of_week
  		@week_end = @week_start + 41
	end

	def weeks
		(@week_start..@week_end).each_slice(7).map do |week| 
			week
		end
	end
end
