class AddClientRefToPlaylist < ActiveRecord::Migration
  def self.up
    add_column :playlists, :client_id, :integer
  end

  def self.down
    remove_column :playlists, :client_id
  end
end
