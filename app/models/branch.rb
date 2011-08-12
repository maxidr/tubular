# encoding: utf-8
class Branch < ActiveRecord::Base
  belongs_to :client
  has_many :players

  validates_presence_of :client, :name
end


# == Schema Information
#
# Table name: branches
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  client_id  :integer
#  created_at :datetime
#  updated_at :datetime
#

