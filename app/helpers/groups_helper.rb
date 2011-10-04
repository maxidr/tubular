module GroupsHelper
  def checked?(selections, option)
    return false if selections.nil?
    selections.detect{ |s| s.id == option.id && s.class == option.class }
  end
end

