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
    @message.split("")
  end

  def split_into_subarrays
    subarray_message = splitter.each_slice(4).to_a
  end

  def encrypt(message)
    @message = message
  end

  def cypher_a_numbers
    temp = split_into_subarrays.map do |first|
      character(first[0]) + @key.key_a
    end
  end

  def cypher_b_numbers
    temp = split_into_subarrays.map do |num|
      character(num[1]) + @key.key_b
    end
  end

  def cypher_c_numbers
    temp = split_into_subarrays.map do |num|
      character(num[2]) + @key.key_c
    end
  end

  def cypher_d_numbers
    temp = split_into_subarrays.map do |num|
      character(num[3]) + @key.key_d
    end
  end

  def cypher_a
    temp = cypher_a_numbers.map do |lookup|
      if lookup > chars.count
        lookup = (lookup - chars.count)
        character_lookup(lookup)
      else
        character_lookup(lookup)
      end
    end
  end

  def cypher_b
    temp = cypher_b_numbers.map do |lookup|
      if lookup > chars.count
        lookup = (lookup - chars.count)
        character_lookup(lookup)
      else
        character_lookup(lookup)
      end
    end
  end

  def cypher_c
    temp = cypher_c_numbers.map do |lookup|
      if lookup > chars.count
        lookup = (lookup - chars.count)
        character_lookup(lookup)
      else
        character_lookup(lookup)
      end
    end
  end

  def cypher_d
    temp = cypher_d_numbers.map do |lookup|
      if lookup > chars.count
        lookup = (lookup - chars.count)
        character_lookup(lookup)
      else
        character_lookup(lookup)
      end
    end
  end

  def collate 
    array = [cypher_a, cypher_b, cypher_c, cypher_d]
    array.transpose.flatten.join
  end

end
binding.pry
""
