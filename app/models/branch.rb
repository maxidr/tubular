# encoding: utf-8
class Branch < ActiveRecord::Base
  belongs_to :client
  has_many :players

  validates_presence_of :client, :name
end

