class CreateSchedules < ActiveRecord::Migration
  def self.up
    create_table :schedules do |t|
      t.string :name
      t.text :description
      t.date :start_date
      t.date :end_date
      t.references :playlist

      t.timestamps
    end
  end

  def self.down
    drop_table :schedules
  end
end
