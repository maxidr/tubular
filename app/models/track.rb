# encoding: utf-8
class Track < ActiveRecord::Base
  include Rails.application.routes.url_helpers

  # RELATIONS --------------------------------------------------------------------------------
  belongs_to :content, :class_name => 'Content'
  belongs_to :playlist

  accepts_nested_attributes_for :content

  composed_of :start_at, :class_name => 'Duration', :allow_nil => true, :mapping => %w(start_time to_s)
#  composed_of :end_time, :class => 'Duration'

  # VALIDATIONS ------------------------------------------------------------------------------
  validates_presence_of :content
#  validates_numericality_of :start_time, :only_integer => true


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
      "delete_type" => "DELETE",
      "edit_url" => edit_track_path(self)
     }
  end

end




# == Schema Information
#
# Table name: tracks
#
#  id          :integer         not null, primary key
#  content_id  :integer
#  position    :integer
#  start_time  :string(10)
#  end_time    :string(10)
#  created_at  :datetime
#  updated_at  :datetime
#  playlist_id :integer
#

