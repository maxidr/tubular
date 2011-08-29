# encoding: utf-8
class Segment < ActiveRecord::Base
  belongs_to :schedule

  attr_writer :checked

  def self.build_default(day)    
    Segment.new(:wday => day,
        :start_time => Time.parse("9:00"),
        :end_time => Time.parse("18:00"),
        :checked => (day.to_i >= 1 and day.to_i <= 5))    
  end

  def checked
    if @checked.nil?
      return true if !id.nil?
    else
      return @checked
    end
#    return @checked if !@checked.nil?
#    return true if @checked.nil? and !id.nil?)
    return false
  end

  def day
    I18n.t("date.day_names")[wday]
  end
  
  def as_json(options = {})
    {
      wday: self.day,      
      start: self.start_time.strftime("%H:%M"),
      end: self.end_time.strftime("%H:%M")
    }
  end
  
end


# == Schema Information
#
# Table name: segments
#
#  id          :integer         not null, primary key
#  wday        :integer
#  start_time  :time
#  end_time    :time
#  schedule_id :integer
#  created_at  :datetime
#  updated_at  :datetime
#

