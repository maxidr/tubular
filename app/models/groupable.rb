module Groupable
  def self.included(clazz)
    has_many :group_associations, :as => :groupable
  end
end
