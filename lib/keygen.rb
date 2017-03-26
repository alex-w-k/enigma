require 'pry'
require './lib/date.rb'

class KeyGen
  attr_reader :key_a, :key_b, :key_c, :key_d

  def initialize
    @date = Date.new
    @key  = self.key_generator
  end

  def key_generator
    chars = *(0..9)
    (1..5).map {chars.sample}.join
  end

  def full_key
    @key
  end

  def key_a
    key_a = @key[0] + @key[1]
    key_a.to_i
  end

  def key_b
    key_b = @key[1] + @key[2]
    key_b.to_i
  end

  def key_c
    key_b = @key[2] + @key[3]
    key_b.to_i
  end
 
  def key_d
    key_b = @key[3] + @key[4]
    key_b.to_i
  end

  def a_with_offset 
    self.key_a + @date.offset[0].to_i
  end 

  def b_with_offset 
    self.key_b + @date.offset[1].to_i
  end

  def c_with_offset 
    self.key_c + @date.offset[2].to_i
  end

  def d_with_offset 
    self.key_d + @date.offset[3].to_i
  end
    
end

binding.pry
""
