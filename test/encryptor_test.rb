gem 'minitest', '~>5.2'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/encryptor.rb'

class EncryptorTest < MiniTest::Test

  def test_init
    encrypt = Encryptor.new
    assert_instance_of Encryptor, encrypt
  end

end
