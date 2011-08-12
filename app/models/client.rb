# encoding: utf-8
class Client < ActiveRecord::Base
  has_many :branches

  validates_presence_of :name
end


# == Schema Information
#
# Table name: clients
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

