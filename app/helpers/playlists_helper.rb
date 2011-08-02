module PlaylistsHelper
  def player_playlist(playlist)
#    playlist.tracks.map { |track| track.asset.url }
    playlist.tracks.map { |t| "'#{t.asset.url}'" }.join(", ")
  end
end

