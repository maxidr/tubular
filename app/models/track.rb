# encoding: utf-8
class Track < ActiveRecord::Base 
  # Element as part of the final content
  belongs_to :track, :class_name => 'Content'
  # Generated content
  belongs_to :content
  
  accepts_nested_attributes_for :track
end


# == Schema Information
#
# Table name: tracks
#
#  id         :integer         not null, primary key
#  content_id :integer
#  track_id   :integer
#  order      :integer
#  start_time :integer
#  end_time   :integer
#  created_at :datetime
#  updated_at :datetime
#

