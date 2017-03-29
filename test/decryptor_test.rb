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

  def test_rotation_without_changes
    decrypt = Decryptor.new
    chars = (('A'..'z').to_a + ('!'..'@').to_a + [" "] + ('😀'..'😾').to_a + ["🖕"])
    assert_equal 155, chars.count
    assert true, decrypt.rotation_a
    assert true, decrypt.rotation_b
    assert true, decrypt.rotation_c
    assert true, decrypt.rotation_d
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
    assert_equal "this is a test ..end..", decrypt.decrypt("&.😭😱😋/😷Zm😟😸😣%:`G:+😲😢:😌", 12881)
    assert_equal decrypt.incoming_key , decrypt.incoming_key
  end
end
