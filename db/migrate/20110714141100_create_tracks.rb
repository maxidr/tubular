class CreateTracks < ActiveRecord::Migration
  def self.up
    create_table :tracks do |t|
      t.integer :resulting_content_id
      t.integer :content_id
      t.integer :order
      t.integer :start_time
      t.integer :end_time

      t.timestamps
    end
  end

  def self.down
    drop_table :tracks
  end
end
