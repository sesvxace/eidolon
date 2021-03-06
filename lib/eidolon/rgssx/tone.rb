# == RGSSx
# This class is present and consistent across all RGSS versions.
# 
# == Tone
# The color tone class. Each component is handled with a floating-point value
# (Float).
class Tone
  # The red balance adjustment value (-255 to 255).
  attr_accessor :red
  
  # The green balance adjustment value (-255 to 255).
  attr_accessor :green
  
  # The blue balance adjustment value (-255 to 255).
  attr_accessor :blue
  
  # The gray balance adjustment value (-255 to 255).
  attr_accessor :gray
  
  private
  def self._load(array)
    self.new.instance_eval do
      @red, @green, @blue, @gray = array.unpack('d4')
      self
    end
  end
end