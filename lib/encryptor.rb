require './lib/keygen'
class Encryptor
  attr_reader :character

  def initialize

  end

  def character(char)
    character_map = Hash[(('A'..'z').to_a + ('0'..'9').to_a).zip((1..68).to_a)]
    character_map[char]
  end

end

encrypt = Encryptor.new
key = KeyGen.new
binding.pry
