module FormtasticExtensions
  
  class DateStringInput < Formtastic::Inputs::StringInput
    def input_html_options
      format = options[:format]
      current_value = @object.try(method)
      unless current_value.blank?
        current_value = current_value.to_date if current_value.is_a? String
        current_value = format ? I18n.l(current_value, :format => format) : I18n.l(current_value)
      else 
        # Esta distinción permite trabajar sobre MetaSearch, ya que no posee _before_type_cast para
        # los atributos generados dinámicamente (ej: created_at_gte)
        current_value = @object.send("#{method}_before_type_cast") if @object.respond_to? "#{method}_before_type_cast"
      end
      super.merge({:size => 10, :value => current_value})
    end
  end

#  class SemanticFormBuilder < Formtastic::FormBuilder    
#    
#    def date_string_input(method, options)
#      format = options[:format]
#      current_value = @object.try(method)

#      if !current_value.blank?
#        current_value = current_value.to_date if current_value.is_a? String
#        current_value = format ? I18n.l(current_value, :format => format) : I18n.l(current_value)
#      elsif @object.respond_to? "#{method}_before_type_cast"
#        # Esta distinción permite trabajar sobre MetaSearch, ya que no posee _before_type_cast para
#        # los atributos generados dinámicamente (ej: created_at_gte)
#        current_value = @object.send("#{method}_before_type_cast")
#      end
#      html_options ||= {:value => current_value , :size => 10}
#      html_options ||= options[:input_html] if options[:input_html]
##      html_options ||= {:value =>  current_value ? I18n.l(current_value) : @object.send("#{method}_before_type_cast")}
#      self.label(method, options.delete(:label), options.slice(:required)) + self.send(:text_field, method, html_options)
#    end

#    def decimal_input(method, options)
#      # html_options ||= options[:input_html] if options[:input_html]
#      self.label(method, options.delete(:label), options.slice(:required)) + self.send(:decimal_field, method, options[:input_html] ? options[:input_html] : {} )
##      basic_input_helper(:text_field, :decimal, method, options)
#    end
#    
#  end
end

