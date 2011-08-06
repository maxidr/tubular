# encoding: utf-8
class Player < ActiveRecord::Base
  belongs_to :branch
  has_one :client, :through => :branch

  validates_presence_of :name, :branch
end

