# encoding: utf-8
class Track < ActiveRecord::Base 
  # RELATIONS --------------------------------------------------------------------------------
  belongs_to :content, :class_name => 'Content'
  belongs_to :playlist
      
  accepts_nested_attributes_for :content
  
  # VALIDATIONS ------------------------------------------------------------------------------
  validates_presence_of :content
  
  
  # SCOPES -----------------------------------------------------------------------------------
  default_scope order(:position)
  
  # OTHER ------------------------------------------------------------------------------------
  delegate :asset, :to => :content
  
  
end



# == Schema Information
#
# Table name: tracks
#
#  id         :integer         not null, primary key
#  content_id :integer
#  position   :integer
#  start_time :integer
#  end_time   :integer
#  created_at :datetime
#  updated_at :datetime
#

