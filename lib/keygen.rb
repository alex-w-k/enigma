# require './lib/encryptor.rb'
# require 'pry'

class KeyGen
  attr_reader :time,
              :key,
              :offset,
              :key_a,
              :key_b,
              :key_c,
              :key_d

  def initialize
    @key = self.key_generator
  end

  def key_generator
    chars = *(0..9)
    (1..5).map {chars.sample}.join
  end

  def time
    time = Time.new
    day = time.day.to_s
    month = time.month.to_s.rjust(2, "0")
    year = time.year.to_s.slice(-2..-1)
    day + month + year
  end

  def offset
    offset = ((self.time.to_i) ** 2).to_s
    offset.split(//).last(4).join
  end

  def key_a
    key_a = key[0] + key[1]
    key_a.to_i + offset[0].to_i
  end

  def key_b
    key_b = key[1] + key[2]
    key_b.to_i + offset[1].to_i
  end

  def key_c
    key_c = key[2] + key[3]
    key_c.to_i + offset[2].to_i
  end

  def key_d
    key_d = key[3] + key[4]
    key_d.to_i + offset[3].to_i
  end
end

# binding.pry
# ""
