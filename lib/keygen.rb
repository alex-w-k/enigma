require "pry"

class KeyGen
  attr_reader :key_generator

  def initialize
  end

  def key_generator(length = 4)
    chars = *(0..9)
    (0..length).map {chars.sample}.join
  end
  
end

binding.pry
""
