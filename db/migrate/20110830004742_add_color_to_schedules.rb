class AddColorToSchedules < ActiveRecord::Migration
  def self.up
    add_column :schedules, :color, :string, :limit => 6
  end

  def self.down
    remove_column :schedules, :color
  end
end

