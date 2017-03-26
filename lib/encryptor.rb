require './lib/keygen'
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

  def message_splitter(message)
    message.delete(' ').split("").map { |x| x.to_s }
  end

  def encrypt(message)
    character(message_splitter(message)[0])
  end

end

e = Encryptor.new
key = KeyGen.new
binding.pry
