require './lib/encryptor'

class Decryptor < Encryptor
  attr_reader :message, :rotation_a, :rotation_b, :rotation_c, :rotation_d, :incoming_key
  attr_accessor :decrypted, :decryption_hash

  def decrypt(message = "", key = @key.key, date = @key.time)
    key_thing = {key: key, date: date}
    @incoming_key = KeyGen.new(key_thing)
    @message = message
    decryption_hash
    decryption_rotator(message)
  end

  def rotate(key)
    rotated_characters = custom_chars.rotate(key.to_i)
    Hash[custom_chars.zip(rotated_characters)]
  end

  def decryption_hash
    @rotation_a = rotate(incoming_key.key_a).invert
    @rotation_b = rotate(incoming_key.key_b).invert
    @rotation_c = rotate(incoming_key.key_c).invert
    @rotation_d = rotate(incoming_key.key_d).invert
  end

  def decryption_rotator(message)
    message = message
    @decrypted = []
    @rotation_count = 1
    letters = message.split("")
    letters.each do |letter|
      decrypt_and_rotate(@decrypted, letter)
    end
    @decrypted.join
  end

  def decrypt_and_rotate(decrypted, letter)
    if @rotation_count == 1
      decrypted << @rotation_a[letter]
      @rotation_count += 1
    elsif @rotation_count == 2
      decrypted << @rotation_b[letter]
      @rotation_count += 1
    elsif @rotation_count == 3
      decrypted << @rotation_c[letter]
      @rotation_count += 1
    elsif @rotation_count == 4
      decrypted << @rotation_d[letter]
      @rotation_count = 1
    end
  end
end
