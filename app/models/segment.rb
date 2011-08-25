# encoding: utf-8
class Segment < ActiveRecord::Base
  belongs_to :schedule

  attr_accessor :checked

  def self.build_default(day)
    Segment.new(:wday => day,
        :start_time => Time.parse("9:00"),
        :end_time => Time.parse("18:00"),
        :checked => (day >= 1 and day <= 5))
  end

  def checked
    return true if @checked.nil? and id
    return @checked
  end

  def day
    I18n.t("date.day_names")[wday]
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

