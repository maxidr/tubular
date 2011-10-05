# encoding: utf-8
class Group < ActiveRecord::Base

  has_many :associations, :class_name => 'GroupAssociation'
  belongs_to :client

  validates_presence_of :name, :client, :associations

  def elements
    associations.map do |association|
      association.groupable
    end
  end

  def update_relations(branch_ids, player_ids)
    items = {"Branch" => [], "Player" => []}
    associations.each { |a| items[a.groupable_type] << a }
    
    logger.debug "branch_ids: #{branch_ids}"
    logger.debug "items['Branch']: #{items['Branch']}"
    
    logger.debug "player_ids: #{player_ids}"
    logger.debug "items['Player']: #{items['Player']}"
    

#    associations_to_remove = []
    associations_to_remove = [] \
      + association_to_remove(items["Branch"], branch_ids) \
      + association_to_remove(items["Player"], player_ids)

    associations_to_remove.each{ |a| a.destroy }

#    branch_ids_to_add = branch_ids.find_all{ |id| items["Branch"].any? {|b| b.groupable_id == id } }

    #  1, 4, 7
    #  1, 7, 8
    # remove: 4
    # add: 8

    branch_ids_to_add = elements_to_add(items["Branch"], branch_ids)
    save_element(Branch, branch_ids_to_add)

    player_ids_to_add = elements_to_add(items["Player"], player_ids)
    logger.debug "Player to add: #{player_ids_to_add}"
    save_element(Player, player_ids_to_add)
  end

  private

  def association_to_remove(items, ids)
    return items if ids.nil?
    items.find_all{ |a| !ids.include?(a.groupable_id.to_s) }
  end

  def elements_to_add(items, ids)
    return [] if ids.nil?
    return ids if items.empty?
    ids.find_all{ |id| !items.any? { |b| b.groupable_id.to_s == id } }
  end

  def save_element(model, ids)
    model.find(ids).each do |m|
      associations.build(:groupable => m).save
    end
  end

end

