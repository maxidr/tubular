# encoding: utf-8
class Player < ActiveRecord::Base
  
  has_many :group_associations, :as => :groupable
  
  belongs_to :branch
  has_one :client, :through => :branch

  validates_presence_of :name, :branch
end


# == Schema Information
#
# Table name: players
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  branch_id  :integer
#  created_at :datetime
#  updated_at :datetime
#

