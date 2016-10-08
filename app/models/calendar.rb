class Calendar
  
  def initialize(params = {})
    @params = params
  end

  def first_day
    params[:cal_start] ? DateTime.parse(params[:cal_start]).beginning_of_week : Date.today.beginning_of_week
  end

  def last_day
    self.first_day + 41
  end

  def weeks
    (first_day..last_day).each_slice(7).map do |week| 
      week
    end
  end

  def params
     @params
  end
end
