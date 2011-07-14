# coding: utf-8
class UploadContent < ActiveRecord::Base
end


# == Schema Information
#
# Table name: upload_contents
#
#  id                 :integer         not null, primary key
#  asset_file_name    :string(255)
#  asset_content_type :string(255)
#  asset_file_size    :integer
#  asset_updated_at   :datetime
#  created_at         :datetime
#  updated_at         :datetime
#

