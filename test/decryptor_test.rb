require_relative 'test_helper'
class DecryptorTest < MiniTest::Test

  def setup
    @decrypt = Decryptor.new
  end

  def test_init
    assert_instance_of Decryptor, @decrypt
  end

  def test_message_rentention
    @decrypt.message = "test"
    assert_equal "test", @decrypt.message
  end

  def test_rotation
    chars = (('A'..'z').to_a + ('!'..'@').to_a + [" "] + ('😀'..'😾').to_a + ["🖕"])
    assert_equal 155, chars.count
    assert_nil @decrypt.rotation_a, @decrypt.rotation_b
    assert_nil @decrypt.rotation_b, @decrypt.rotation_c
    assert_nil @decrypt.rotation_c, @decrypt.rotation_d
  end


  def test_rotating_zipper_hash
    chars = (('A'..'z').to_a + ('!'..'@').to_a + [" "] + ('😀'..'😾').to_a + ["🖕"])
    rotated_characters = chars.rotate(1)
    hash = Hash[chars.zip(rotated_characters)]
    assert_equal "B", hash["A"]
  end

  def test_decryption_final
    assert_equal "this is a test ..end..", @decrypt.decrypt("😰😩😷😷W😪!_😝\\\"😩😯😵ime😦😼😨ej", '55654', '300317')
    assert_equal @decrypt.incoming_key , @decrypt.incoming_key
  end
end
e = Encryptor.new
puts e.encrypt({message: 'this is a test ..end..', key:{}})

