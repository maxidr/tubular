# encoding: utf-8
class Schedule < ActiveRecord::Base
  belongs_to :playlist
  has_many :segments, :dependent => :destroy

  accepts_nested_attributes_for :segments, 
    :reject_if => proc { |attrs| attrs['schedule_id'] == "0" && attrs['_destroy'].blank? },  
    :allow_destroy => true


  validates_presence_of :name, :start_date, :end_date, :segments
  #  TODO: Validar que la fecha "start_date" sea anterior a "end_date"

  def self.build_default
    t = Date.today
    obj = Schedule.new(:start_date => t.at_beginning_of_month, :end_date => t.at_end_of_month)
    Date::DAYNAMES.each_with_index { |day, index| obj.segments << Segment.build_default(day) }
    obj
  end
end


# == Schema Information
#
# Table name: schedules
#
#  id          :integer         not null, primary key
#  name        :string(255)
#  description :text
#  start_date  :date
#  end_date    :date
#  playlist_id :integer
#  created_at  :datetime
#  updated_at  :datetime
#

