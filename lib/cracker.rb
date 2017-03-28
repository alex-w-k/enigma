require 'pry'
require './lib/keygen'
require './lib/decryptor'

class Cracker < Decryptor

  attr_reader :decrypted

  def crack(message, date)
    @message = message
    @date = date
    crack_looper
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
  end

  def crack_looper
    i = 0
    @decrypted = [""]
    until @decrypted.join.include?("..end..")
      if i.to_s.length < 5
        @incoming_key = KeyGen.new(i.to_s.rjust(5, "0"),@date)
        decryption_hash
        decryption_rotator(@message)
        i += 1
      else
        @incoming_key = KeyGen.new(i.to_s)
        decryption_hash
        decryption_rotator(@message)
        i += 1
      end
    end
    @decrypted.join
  end

end

c = Cracker.new
binding.pry
""
