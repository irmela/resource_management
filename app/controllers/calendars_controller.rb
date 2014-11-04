class CalendarsController < ApplicationController
  def show
  	$calendar = Calendar.new(params)
  	@week_start = params[:cal_start] ? DateTime.parse(params[:cal_start]).beginning_of_week : Date.today.beginning_of_week
  	#@week_end = @week_start + 41
  	@ressources = params[:department] ? Ressource.where(department: params[:department]) : Ressource.all.order('department')
  end
end
