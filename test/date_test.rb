gem 'minitest', '~>5.2'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/date.rb'

class DateTest < MiniTest::Test

  def test_init
    date = Date.new
    assert_instance_of Date, date
  end

  def test_time
    date = Date.new
    assert_equal "250317", date.time
  end

  def test_time_and_offset
    date = Date.new
    assert_equal 4, date.offset.length
  end

  
end
