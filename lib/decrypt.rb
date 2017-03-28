require 'pry'
require './lib/encryptor'

class Decryptor < Encryptor
  attr_reader :decrypt

  def decrypt(message = "", key = @key.key, date = @key.time)
    @message = message
    create_decryption_hash
    decryption_rotator(message)
  end

  def rotate(key)
    rotated_characters = chars.rotate(key.to_i)
    Hash[chars.zip(rotated_characters)]
  end

  def create_decryption_hash
    @rotation_a = rotate(@key.key_a).invert
    @rotation_b = rotate(@key.key_b).invert
    @rotation_c = rotate(@key.key_c).invert
    @rotation_d = rotate(@key.key_d).invert
  end

  def decryption_rotator(message)
  @message = message
  @encrypted = []
  @rotation_count = 1
  letters = message.split("")
  letters.each do |letter|
    if @rotation_count == 1
      @encrypted << @rotation_a[letter]
      @rotation_count += 1
    elsif @rotation_count == 2
      @encrypted << @rotation_b[letter]
      @rotation_count += 1
    elsif @rotation_count == 3
      @encrypted << @rotation_c[letter]
      @rotation_count += 1
    elsif @rotation_count == 4
      @encrypted << @rotation_d[letter]
      @rotation_count = 1
    end
    @encrypted.join
  end
  @encrypted.join
  end
end

d = Decryptor.new
binding.pry
""
