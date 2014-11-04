class CalendarsController < ApplicationController
  def show
  	$calendar = Calendar.new(params)
  	$ressources = params[:department] ? Ressource.where(department: params[:department]) : Ressource.all.order('department')
  end
end
