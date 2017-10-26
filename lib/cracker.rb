require './lib/keygen'
require './lib/decryptor'

class Cracker < Decryptor

  attr_reader :decrypted, :crack, :key

  def crack(message, date)
    @message = message
    @date = date
    crack_looper
  end

  def rotate(key)
    rotated_characters = custom_chars.rotate(key.to_i)
    Hash[custom_chars.zip(rotated_characters)]
  end

  def crack_looper
    i = 0
    @decrypted = [""]
    until @decrypted.join.include?("..end..") || i == 99999
      if i.to_s.length < 5
        @incoming_key = KeyGen.new({key: i.to_s.rjust(5, "0"), date: @date})
        decryption_hash
        decryption_rotator(@message)
        i += 1
      else
        @incoming_key = KeyGen.new({key: i.to_s, date: @date})
        decryption_hash
        decryption_rotator(@message)
        i += 1
      end
    end
    key = i
    @decrypted.join
    puts "#{@decrypted.join} cracked with key #{key}"
  end

end
