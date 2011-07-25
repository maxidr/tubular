# encoding: UTF-8
module ContentsHelper
  def playlist
    out = ""
    if @content.asset.exists?
      out = "'#{@content.asset.url}'"
    else
      @content.tracks.each do |track|
        out += "'#{track.asset.url}', " if track.asset.exists?
      end
    end
    out
  end

  def track_info(track)
    "<b>#{track.content.name}</b>, archivo: #{track.content.asset_file_name}, duración: #{track.content.duration}"
  end

end

