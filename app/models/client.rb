# encoding: utf-8
class Client < ActiveRecord::Base
  has_many :branches

  validates_presence_of :name
end

