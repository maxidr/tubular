module CalendarsHelper
  # Format json output data expected by calendar
  def format_schedules_to_calendar(schedules)
    schedules.map do |schedule|
      { :id     => schedule.id,
        :title  => schedule.name,
        :start  => schedule.start_date.to_s,
        :end    => schedule.end_date.to_s,
        :color  => "##{schedule.color}" }
    end
  end
end

