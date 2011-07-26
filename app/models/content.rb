# encoding: utf-8
class Content < ActiveRecord::Base

  validates_presence_of :name

  has_attached_file :asset

  has_many :tracks, :foreign_key => :resulting_content_id

  has_many :in_tracks, :foreign_key => :content_id, :class_name => 'Track', :dependent => :destroy


  # TODO: Guardar la información de tiempo en la base de datos, para evitar el recalculo.
  def duration
    get_video_file_duration
  end

  def original?
    !tracks.empty?
  end

  private

  def get_video_file_duration
    return '' unless asset.exists?
	  command = "ffmpeg -i '#{asset.path}' 2>&1 | grep 'Duration' | cut -d ' ' -f 4 | sed s/,//"
    output = `#{command}`.chomp.to_s

#    if output =~ /([\d][\d]):([\d][\d]):([\d][\d]).([\d]+)/
#	     duration = (($1.to_i * 60 + $2.to_i) * 60 + $3.to_i) * 10 + $4.to_i
#    end

#    return duration.to_s
#    return "#{$2}:#{$3}"
  end

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

