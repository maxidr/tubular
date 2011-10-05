module GroupsHelper
  def checked?(selections, option)
    return false if selections.nil?
    selections.detect{ |s| s.id == option.id && s.class == option.class }
  end
  
  def branches_selected(group)
    group.elements.find_all{|e| e.is_a? Branch}.map(&:id).to_json
  end
  
  def players_selected(group)
    group.elements.find_all{|e| e.is_a? Player}.map(&:id).to_json
  end
  
  def load_tree?
    action_name == 'edit' || (action_name == 'create' and @group.client)
  end
  
end

