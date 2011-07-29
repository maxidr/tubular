class RemoveResultingContentFromTracks < ActiveRecord::Migration
  def self.up
    remove_column :tracks, :resulting_content_id
  end

  def self.down
    add_column :tracks, :resulting_content_id, :integer
  end
end
