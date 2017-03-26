gem 'minitest', '~>5.2'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/encryptor.rb'

class EncryptorTest < MiniTest::Test

  def test_init
    encrypt = Encryptor.new
    assert_instance_of Encryptor, encrypt
  end

  def test_character_map
    encrypt = Encryptor.new
    assert_equal 39, encrypt.character("g")
    assert_equal 68, encrypt.character("9")
  end

  def test_message_splitter
    encrypt = Encryptor.new
    assert_equal ["t", "e", "s", "t", "t", "h", "i", "s", "m", "e", "s", "s", "a", "g", "e"], encrypt.splitter("test this message")
  end
end
