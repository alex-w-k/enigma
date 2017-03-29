gem 'minitest', '~>5.2'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/encryptor.rb'

class EncryptorTest < MiniTest::Test

  def test_init
    e = Encryptor.new
    assert_instance_of Encryptor, e 
    assert_instance_of KeyGen, e.key
    assert_equal e.message, ""
  end

  def test_chars
    e = Encryptor.new
    assert e.chars
    assert_equal 155, e.chars.count
  end

  def test_encryptor_can_accept_message_key_and_date
    e = Encryptor.new
    e.encrypt("This is soooooo secret", "12345")
    assert_equal "This is soooooo secret", e.message
    assert_equal "12345", e.key.key
  end

  def test_rotate
    e = Encryptor.new
    assert e.rotate(e.key.to_s)
    assert_instance_of Hash, e.rotate(e.key.to_s)
  end

  def test_can_create_encryption_hash
    e = Encryptor.new
    e.create_encryption_hash
    assert_equal 155, e.rotation_a.count
    assert_equal 155, e.rotation_b.count
    assert_equal 155, e.rotation_c.count
    assert_equal 155, e.rotation_d.count
  end

  def test_are_hashes_different
    e = Encryptor.new
    e.create_encryption_hash
    refute_equal e.rotation_a, e.rotation_b
    refute_equal e.rotation_a, e.rotation_c
    refute_equal e.rotation_a, e.rotation_d
    refute_equal e.rotation_b, e.rotation_c
    refute_equal e.rotation_b, e.rotation_d
    refute_equal e.rotation_c, e.rotation_d
  end


  def test_encryptor_can_encrypt_and_is_string
    e = Encryptor.new
    refute_equal "hello", e.encrypt("hello")
    assert_instance_of String, e.encrypt("hello")
  end

  def test_can_encryptor_encrypt_when_given_key_and_is_string
    e = Encryptor.new
    refute_equal "hello", e.encrypt("hello", 12345)
    assert_instance_of String, e.encrypt("hello", 23456)
  end

end
