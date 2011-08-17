# encoding: utf-8
class Segment < ActiveRecord::Base
  belongs_to :schedule
  
  attr_accessor :checked

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

