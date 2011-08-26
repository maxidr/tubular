module ApplicationHelper
  def show_time(value)
    l value, :format => :hour_minutes
  end
end
