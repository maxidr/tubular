# encoding: utf-8
class Playlist < ActiveRecord::Base
  has_many :tracks
  
  validates_presence_of :name
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

