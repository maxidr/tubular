class VideoPositionInput < Formtastic::Inputs::TimeInput
  
  def time_fragments
    [:hour, :minute, :second]
  end
  
  
  def fragment_input_html(fragment, options = {}, html_options = {})
    opts = input_options.merge(:prefix => object_name, :field_name => fragment_name(fragment), :default => value, :include_blank => include_blank?)
    self.send("select_test", value, opts, input_html_options.merge(:id => fragment_id(fragment)))
  end
  
  def select_test(value, options = {}, html_options = {})
    object
#    TODO: No finalizado, se recurre a algo mas sencillo hasta que determinen como prefieren el control
  end

#  def to_html
#    input_wrapping do
#      fragment_wrapping do
#        template.content_tag(:ol, 
#          fragments.map do |fragment| 
#            fragment_wrapping do
#              fragment_label_html(fragment) << fragment_input_html(fragment)
#            end
#          end.join.html_safe, { :class => 'fragments-group' }
#        )
#      end
#    end

#  end
end
