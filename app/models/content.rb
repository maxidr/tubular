# encoding: utf-8
class Content < ActiveRecord::Base
   
  validates_presence_of :name
    
  has_attached_file :asset
  
  has_many :tracks, :foreign_key => :resulting_content_id
  
  has_many :in_tracks, :foreign_key => :content_id, :class_name => 'Track', :dependent => :destroy
  
end



# == Schema Information
#
# Table name: contents
#
#  id                 :integer         not null, primary key
#  name               :string(255)
#  description        :text
#  created_at         :datetime
#  updated_at         :datetime
#  asset_file_name    :string(255)
#  asset_content_type :string(255)
#  asset_file_size    :integer
#  asset_updated_at   :datetime
#

