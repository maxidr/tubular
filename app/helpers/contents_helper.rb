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
    
end
