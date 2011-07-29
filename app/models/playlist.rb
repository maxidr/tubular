# encoding: utf-8
class Playlist < ActiveRecord::Base
  has_many :tracks  
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

