# encoding: utf-8
class Content < ActiveRecord::Base

  has_attached_file :asset

  # TODO: Guardar la información de tiempo en la base de datos, para evitar el recalculo.
  def duration
    get_video_file_duration
  end

  def original?
    !tracks.empty?
  end
  
  def name
    read_attribute(:name).blank? ? asset_file_name : read_attribute(:name)
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
  
  # TODO: Incorporar este procesamiento a paperclip para que ejecute al subir una imagen
  def take_video_a_snapshot
    command = "ffmpeg -i '#{asset.path} -t 00:00:10 -ss 00:00:10 -vframes 1 snapshot.jpg 2>&1"
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

