class KeyGen
  attr_reader :key_a, :key_b, :key_c, :key_d

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
end