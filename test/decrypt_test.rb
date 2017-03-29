gem 'minitest', '~>5.2'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/decrypt'

class DecryptTest < MiniTest::Test

  def test_does_it_initialize
    d = Decrypt.new
    assert_instance_of Decrypt, d
  end

  def test_does_it_read_files


end
