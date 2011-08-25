# encoding: utf-8
class Schedule < ActiveRecord::Base
  belongs_to :playlist
  has_many :segments

  accepts_nested_attributes_for :segments, 
    :reject_if => proc { |attrs| attrs['checked'].blank? && attrs['_destroy'].blank? }, 
    :allow_destroy => true


  validates_presence_of :name, :start_date, :end_date, :segments
  #  TODO: Validar que la fecha "start_date" sea anterior a "end_date"

  def build_default_segments
    Date::DAYNAMES.each_with_index { |day, index| segments << Segment.build_default(day) }
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

