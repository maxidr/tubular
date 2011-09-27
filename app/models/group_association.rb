# encoding: utf-8
class GroupAssociation < ActiveRecord::Base
  belongs_to :groupable, :polymorphic => true
  belongs_to :group
end

