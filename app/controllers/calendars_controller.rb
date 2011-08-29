class CalendarsController < ApplicationController

  respond_to :json, :only => :events

  def index    
  end
  
  def events
    start_date = Time.at(params[:start].to_i)
    end_date = Time.at(params[:end].to_i)
    @schedules = Schedule.in_range(start_date, end_date)
    respond_with @schedules
  end

end
