gem 'minitest', '~>5.2'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/keygen.rb'

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
    key = KeyGen.new
    assert_equal key.full_key[0..1], key.key_a.to_s
  end

end