class ChangesColumnsFromTracks < ActiveRecord::Migration
  def self.up
    change_column :tracks, :start_time, :string, :limit => 10
    change_column :tracks, :end_time, :string, :limit =>10
  end

  def self.down
    change_column :tracks, :start_time, :integer
    change_column :tracks, :end_time, :integer      
  end
end
