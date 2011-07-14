class AddAssetToContent < ActiveRecord::Migration
  def self.up
    add_column :contents, :asset_file_name, :string
    add_column :contents, :asset_content_type, :string
    add_column :contents, :asset_file_size, :integer
    add_column :contents, :asset_updated_at, :datetime
  end

  def self.down
    remove_column :contents, :asset_updated_at
    remove_column :contents, :asset_file_size
    remove_column :contents, :asset_content_type
    remove_column :contents, :asset_file_name
  end
end
