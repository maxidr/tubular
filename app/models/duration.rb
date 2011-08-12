class Duration

  attr_reader :hours, :minutes, :seconds, :millis

  def initialize(args = {})
    @hours = @minutes = @seconds = @millis = 0
    unless args.empty?
      args.each do |k, v|
        instance_variable_set("@#{k}", v) unless v.nil?
      end
    end
  end

  def to_s
    "#{@hours}:#{@minutes}:#{@seconds}.#{@millis == 0 ? '00' : @millis}"
  end
end

