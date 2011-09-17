class AddPersonalInfoToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :name, :string
    add_column :users, :surname, :string
  end

  def self.down
    remove_column :users, :surname
    remove_column :users, :name
  end
end

