module CalendarsHelper
  def segments_to_json(segments)
    segments.map { |segment|
      { wday: segment.day, 
        start: segment.start_time.strftime("%H:%M"), 
        end: segment.end_time.strftime("%H:%M") }
    }.to_json
  end
  
  def tracks_to_json(tracks)
    tracks.map { |track| 
      { name: track.content.name,
        publish_at: track.publish_at,
        expire_at: track.expire_at,
        duration: track.content.duration,
        size: number_to_human_size(track.asset.size, :locale => :en) }
    }.to_json
  end
    
end
