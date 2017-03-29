gem 'minitest', '~>5.2'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/decryptor.rb'


class DecryptorTest < MiniTest::Test

  def test_init
    decrypt = Decryptor.new
    assert_instance_of Decryptor, decrypt
  end

  def test_message_rentention
    decrypt = Decryptor.new
    decrypt.message = "test"
    assert_equal "test", decrypt.message
  end

  def test_rotation
    decrypt = Decryptor.new
    chars = (('A'..'z').to_a + ('!'..'@').to_a + [" "] + ('😀'..'😾').to_a + ["🖕"])
    assert_equal 155, chars.count
    assert_nil decrypt.rotation_a, decrypt.rotation_b
    assert_nil decrypt.rotation_b, decrypt.rotation_c
    assert_nil decrypt.rotation_c, decrypt.rotation_d
  end


  def test_rotating_zipper_hash
    decrypt = Decryptor.new
    chars = (('A'..'z').to_a + ('!'..'@').to_a + [" "] + ('😀'..'😾').to_a + ["🖕"])
    rotated_characters = chars.rotate(1)
    hash = Hash[chars.zip(rotated_characters)]
    assert_equal "B", hash["A"]
  end

  def test_decryption_final
    decrypt = Decryptor.new
    assert_equal "this is a test ..end..", decrypt.decrypt("&.😭😱😋/😷Zm😟😸😣%:`G:+😲😢:😌", 280317)
    assert_equal decrypt.incoming_key , decrypt.incoming_key
    #assert_equal 22, decrypted.@encrypted
  end
end
