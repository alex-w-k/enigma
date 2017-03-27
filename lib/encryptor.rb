require 'pry'
require './lib/keygen'

class Encryptor
  attr_reader :character,
              :encrypt,
              :message_splitter

  def initialize
    @key = KeyGen.new
    @message = ""
  end

  def message
    @message
  end

  def character(char)
    character_map[char]
  end

  def character_lookup(number)
    character_map.key(number)
  end

  def character_map
    @character_map ||= Hash[chars.zip((1..chars.count).to_a)]
  end

  def chars
    @chars ||= (('A'..'z').to_a + ('!'..'@').to_a + [" "] + ('😀'..'😾').to_a + ["🖕"])
  end

  def splitter
    @message.split("").map { |x| x.to_s }
  end

  def split_into_subarrays
    @message = @message.split("")
    @message = @message.each_slice(4).to_a
  end

  def encrypt(message)
    @message = message
  end

  def cypher_a
    temp = @message.map do |first|
      character(first[0]) + @key.key_a
    end
    temp = temp.map do |lookup|
      if lookup > 155
        155 - lookup
        character_lookup(lookup)
      else
        character_lookup(lookup)
      end
    end
    temp
  end

  def cypher_b
  end

  def cypher_c
  end

  def cypher_d
  end

end

binding.pry
""
