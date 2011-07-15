# encoding: utf-8
class Track < ActiveRecord::Base 
  # Element as part of the final content
  belongs_to :content, :class_name => 'Content'
  # Generated content
  belongs_to :resulting_content, :class_name => 'Content'
  
  accepts_nested_attributes_for :content
  
  validates_presence_of :content, :position
  
  default_scope order(:position)
end




# == Schema Information
#
# Table name: tracks
#
#  id                   :integer         not null, primary key
#  resulting_content_id :integer
#  content_id           :integer
#  position             :integer
#  start_time           :integer
#  end_time             :integer
#  created_at           :datetime
#  updated_at           :datetime
#

