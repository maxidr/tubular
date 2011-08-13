class Duration

  attr_accessor :hours, :minutes, :seconds, :millis

  def initialize(value = nil)
    @hours = @minutes = @seconds = @millis = 0
    return if value.nil? or ! value.is_a? String
    if /\A(?<hours>\d{1,2}):(?<minutes>\d{1,2}):(?<seconds>\d{1,2})\.(?<millis>\d{1,2})\z/ =~ value or /\A(?<hours>\d{1,2}):(?<minutes>\d{1,2}):(?<seconds>\d{1,2})\z/ =~ value
      @hours = hours.to_i
      @minutes = minutes.to_i
      @seconds = seconds.to_i
      @millis = millis.to_i if millis
    else
      raise "Argumento invalido"
    end

#    unless args.empty?
#      args.each do |k, v|
#        instance_variable_set("@#{k}", v) unless v.nil?
#      end
#    end
  end

  def to_s
    [@hours, @minutes, @seconds].map{|v| pad_fragment(v)}.join(":") << "." << pad_fragment(@millis)
  end

  private

  def pad_fragment(fragment)
    fragment.to_s.rjust(2, '0')
  end
end

