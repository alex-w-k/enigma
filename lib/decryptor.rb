require './lib/encryptor'

class Decryptor < Encryptor
  attr_reader :decrypt_rotation_a, :decrypt_rotation_b, :decrypt_rotation_c, :decrypt_rotation_d
  attr_accessor :decrypted

  def decrypt(message = "", key = @key.key, date = @key.time)
    @incoming_key = KeyGen.new(key.to_s, date)
    @message = message
    decryption_hash
    decryption_rotator(message)
  end

  def rotate(key)
    rotated_characters = chars.rotate(key.to_i)
    Hash[chars.zip(rotated_characters)]
  end

  def decryption_hash
    @rotation_a = rotate(@incoming_key.key_a).invert
    @rotation_b = rotate(@incoming_key.key_b).invert
    @rotation_c = rotate(@incoming_key.key_c).invert
    @rotation_d = rotate(@incoming_key.key_d).invert
    binding.pry
  end

  def decryption_rotator(message)
  @message = message
  @decrypted = []
  @rotation_count = 1
  letters = message.split("")
  letters.each do |letter|
    if @rotation_count == 1
      @decrypted << @rotation_a[letter]
      @rotation_count += 1
    elsif @rotation_count == 2
      @decrypted << @rotation_b[letter]
      @rotation_count += 1
    elsif @rotation_count == 3
      @decrypted << @rotation_c[letter]
      @rotation_count += 1
    elsif @rotation_count == 4
      @decrypted << @rotation_d[letter]
      @rotation_count = 1
    end
  end
  @decrypted.join
  end
end
