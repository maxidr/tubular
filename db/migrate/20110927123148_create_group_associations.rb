class CreateGroupAssociations < ActiveRecord::Migration
  def self.up
    create_table :group_associations do |t|
      t.integer :group_id
      t.references :groupable, :polymorphic => true      
    end
  end

  def self.down
    drop_table :group_associations
  end
end
