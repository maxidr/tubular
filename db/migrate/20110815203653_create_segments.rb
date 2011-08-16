class CreateSegments < ActiveRecord::Migration
  def self.up
    create_table :segments do |t|
      t.integer :wday
      t.time :start_time
      t.time :end_time
      t.references :schedule

      t.timestamps
    end
  end

  def self.down
    drop_table :segments
  end
end

