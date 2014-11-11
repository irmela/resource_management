class CalendarsController < ApplicationController
  def show
  	@calendar = Calendar.new(calendar_params)
  	@ressources = params[:department] ? Ressource.where(department: params[:department]) : Ressource.all.order('department')
  end
  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def calendar_params
      params.permit(:cal_start, :department)
    end
end
