require './lib/date.rb'
require 'pry'

class KeyGen
  attr_reader :key_a, :key_b, :key_c, :key_d, :key

  def initialize
    @key = self.key_generator
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
    p key_a.to_i + @offset_a.to_i
  end

  def key_b
    key_b = @key[1] + @key[2]
    p key_b.to_i + @offset_b.to_i
  end

  def key_c
    key_c = @key[2] + @key[3]
    sum = key_c.to_i + @offset_c
    sum
  end

  def key_d
    key_d = @key[3] + @key[4]
    p key_d.to_i + @offset_d.to_i
  end
end

key = KeyGen.new
binding.pry
""
