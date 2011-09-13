# encoding: utf-8
class Playlist < ActiveRecord::Base
  has_many :tracks
  belongs_to :client
  
  validates_presence_of :name, :client
end


# == Schema Information
#
# Table name: playlists
#
#  id          :integer         not null, primary key
#  name        :string(255)
#  description :text
#  created_at  :datetime
#  updated_at  :datetime
#

