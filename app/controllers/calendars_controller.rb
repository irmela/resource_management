class CalendarsController < ApplicationController
  def show
  	@calendar = Calendar.new(calendar_params)
  	@resources = params[:department] ? Resource.where(department: params[:department]) : Resource.all.order('department')
  end
  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def calendar_params
      params.permit(:cal_start, :department)
    end
end
