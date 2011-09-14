class AddPublishAndExpireToTracks < ActiveRecord::Migration
  def self.up
    add_column :tracks, :publish_at, :date
    add_column :tracks, :expire_at, :date
  end

  def self.down
    remove_column :tracks, :expire_at
    remove_column :tracks, :publish_at
  end
end
