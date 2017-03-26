require './lib/keygen'
require "pry"

class Encryptor
  attr_reader :character,
              :encrypt,
              :message_splitter

  def initialize
  end

  def character(char)
    character_map = Hash[(('A'..'z').to_a + ('0'..'9').to_a).zip((1..68).to_a)]
    character_map[char]
  end

  def splitter(message)
    message.delete(' ').split("").map { |x| x.to_s }
  end

  def encrypt(message)
    marker = 0
    char_map_numbers = []
    until marker == message.delete(' ').length
      char_map_numbers << character(splitter(message)[marker])
      marker += 1
    end
    char_map_numbers.each_slice(4) { |n| p n + $key.key_d}
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

e = Encryptor.new
$key = KeyGen.new
binding.pry
