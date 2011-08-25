module SchedulesHelper

  def week_segments(schedule)
    7.times.collect do |day|
      segment = schedule.segments.detect { |s| s.wday == day }
      segment.nil? ? Segment.build_default(day) : segment
    end
  end
end

