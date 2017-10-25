require_relative 'test_helper'
class KeyGenTest < MiniTest::Test

  def test_init
    key = KeyGen.new
    assert_instance_of KeyGen, key
  end

  def test_key_generator
    key = KeyGen.new
    assert_equal 5, key.key_generator.length
  end

  def test_individual_keys
    skip
    key = KeyGen.new
    binding.pry
    assert_equal key.key[0..1], key.key_a.to_s
  end

  def test_key_a_offset
    skip
    key = KeyGen.new
    date = Date.new
    assert_equal (date.offset[0] + self.key_a), a_with_offset
  end
  

end
