# encoding: utf-8
class Track < ActiveRecord::Base 
  include Rails.application.routes.url_helpers
  
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
  
  def to_jq_upload
    {
      "id" => id,
      "name" => content.try(:name),
      "size" => asset.try(:size),
      "url" => asset.try(:url),
      "duration" => content.try(:duration),
      #"thumbnail_url" => avatar.thumb.url,
      "delete_url" => track_path(id),
      "delete_type" => "DELETE" 
     }
  end
  
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

