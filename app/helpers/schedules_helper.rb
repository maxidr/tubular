module SchedulesHelper

  def week_segments(schedule)
    7.times.collect do |day|
      segment = schedule.segments.detect { |s| s.wday == day }
      segment.nil? ? Segment.build_default(day) : segment
    end
  end
  
  def week_row_content(schedule, day)
    segment = schedule.segments.detect{ |s| s.wday == day }
    segment ? "#{segment.start_time.strftime("%H:%M")} a #{segment.end_time.strftime("%H:%M")}" : '-'    
  end
end

