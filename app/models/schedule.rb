# encoding: utf-8
class Schedule < ActiveRecord::Base  
  belongs_to :playlist  
  has_many :segments
  
  accepts_nested_attributes_for :segments
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

