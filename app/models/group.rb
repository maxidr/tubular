# encoding: utf-8
class Group < ActiveRecord::Base

  has_many :associations, :class_name => 'GroupAssociation'
  belongs_to :client

  validates_presence_of :name, :client

  def elements
    associations.map do |association|
      association.groupable
    end
  end

end

