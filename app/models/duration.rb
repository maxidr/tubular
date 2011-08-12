class Duration

  attr_accessor :hours, :minutes, :seconds, :millis

  def initialize(args = {})
    @hours = @minutes = @seconds = @millis = 0
    unless args.empty?
      args.each do |k, v|
        instance_variable_set("@#{k}", v) unless v.nil?
      end
    end
  end  

  def to_s
    [@hours, @minutes, @seconds].map{|v| pad_fragment(v)}.join(":") << "." << pad_fragment(@millis)
  end
  
  private 
  
  def pad_fragment(fragment)
    fragment.to_s.rjust(2, '0')
  end
end

