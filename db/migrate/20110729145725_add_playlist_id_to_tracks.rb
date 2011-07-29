class AddPlaylistIdToTracks < ActiveRecord::Migration
  def self.up
    add_column :tracks, :playlist, :references
  end

  def self.down
    remove_column :tracks, :playlist
  end
end
