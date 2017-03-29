gem 'minitest', '~>5.2'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/cracker.rb'

class CrackTest  < MiniTest::Test

  def test_crack_message
    cracker = Cracker.new
    cracker.message = "test", 23011
    assert_equal ["test", 23011], cracker.message
  end

  def test_crack_final
    cracker = Cracker.new
    assert_equal "this is a test ..end..", cracker.crack("&.😭😱😋/😷Zm😟😸😣%:`G:+😲😢:😌", 280317)
  end
end
