require './lib/keygen'
require "pry"

class Encryptor
  attr_reader :character,
              :encrypt,
              :message_splitter

  def initialize(message)
    @key = KeyGen.new
    @message = message
  end

  def character(char)
    chars = (('A'..'z').to_a + ('!'..'?').to_a)
    chars << ' '
    count = chars.count
    character_map = Hash[chars.zip((1..90).to_a)]
    character_map[char]
  end

  def splitter
    @message.split("").map { |x| x.to_s }
  end

  def split_into_array_of_arrays
    @message = message.split("")
    @message = message.each_slice(4).to_a
  end

  def encrypt(message)
    length = message.length
    char_map_numbers = []
    marker = 0
    until marker == length
      char_map_numbers << character(splitter(message)[marker])
      marker +=1
      char_map_numbers.each_slice(4) do |x|
      p x + @key.key_d
      end
    end
  end

  def cypher_a

  end

  def cypher_b
  end

  def cypher_c
  end

  def cypher_d
  end

end

e = Encryptor.new("this is a test message")
$key = KeyGen.new
binding.pry
