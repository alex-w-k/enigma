require './lib/keygen.rb'

class Encryptor
  attr_reader :encrypt,
              :rotation_a,
              :rotation_b,
              :rotation_c,
              :rotation_d,
              :key

  attr_accessor :encrypted, :message
  def initialize
    @key = KeyGen.new
    @message = ""
  end

  def message
    @message
  end

  def custom_chars
    @chars ||= ((' '..'z').to_a + ('😀'..'😾').to_a + ["🖕"])
  end

  def encrypt(args = {})
    args[:message] ? @message = args[:message] : message_error
    @key = KeyGen.new(args[:key])
    create_encryption_hash
    encryption_rotator(message)
  end

  def rotate(key)
    rotated_characters = custom_chars.rotate(key.to_i)
    Hash[custom_chars.zip(rotated_characters)]
  end

  def create_encryption_hash
    @rotation_a = rotate(@key.key_a)
    @rotation_b = rotate(@key.key_b)
    @rotation_c = rotate(@key.key_c)
    @rotation_d = rotate(@key.key_d)
  end

  def encryption_rotator(message)
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
    end
    @encrypted.join
  end

  private

  def message_error
    raise RuntimeError.new('Message not supplied, please check syntax and try again')
  end
end
