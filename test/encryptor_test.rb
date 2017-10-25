require_relative 'test_helper'
class EncryptorTest < MiniTest::Test

  def setup
    @e = Encryptor.new
  end

  def test_init
    assert_instance_of Encryptor, @e 
    assert_instance_of KeyGen, @e.key
    assert_equal @e.message, ""
  end

  def test_chars
    assert @e.custom_chars
    assert_equal 155, @e.custom_chars.count
  end

  def test_encryptor_can_accept_message_key_and_date
    @e.encrypt({message: "This is soooooo secret", key: {key: '12345', date: '290317'}})
    assert_equal "This is soooooo secret", @e.message
    assert_equal "12345", @e.key.key
  end

  def test_rotate
    assert @e.rotate(@e.key.to_s)
    assert_instance_of Hash, @e.rotate(@e.key.to_s)
  end

  def test_can_create_encryption_hash
    @e.create_encryption_hash
    assert_equal 155, @e.rotation_a.count
    assert_equal 155, @e.rotation_b.count
    assert_equal 155, @e.rotation_c.count
    assert_equal 155, @e.rotation_d.count
  end

  def test_are_hashes_different
    @e.create_encryption_hash
    refute_equal @e.rotation_a, @e.rotation_b
    refute_equal @e.rotation_a, @e.rotation_c
    refute_equal @e.rotation_a, @e.rotation_d
    refute_equal @e.rotation_b, @e.rotation_c
    refute_equal @e.rotation_b, @e.rotation_d
    refute_equal @e.rotation_c, @e.rotation_d
  end


  def test_encryptor_can_encrypt_and_is_string
    refute_equal "hello", @e.encrypt({message: "hello", key: {key: '12345', date: '290317'}})
    assert_instance_of String, @e.encrypt({message: "hello", key: {key: '12345', date: '290317'}})
  end

  def test_can_encryptor_encrypt_when_given_key_and_is_string
    refute_equal "hello", @e.encrypt({message: "hello", key: {key: '12345', date: '290317'}})
    assert_instance_of String, @e.encrypt({message: "hello", key: {key: '12345', date: '290317'}})
  end

  def test_it_actually_encrypts_something_correctly
    assert_equal "t😅😛😧😀", @e.encrypt({message: "hello", key: {key: '12345', date: '290317'}})
  end

  def test_it_raises_error_when_no_message_supplied
    assert_raises RuntimeError do
      @e.encrypt()
    end
  end
end
