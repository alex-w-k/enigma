require "pry"

class Date
  attr_accessor :time, :offset_full, :offset_a, :offset_b, :offset_c, :offset_d

  def initialize
    @offset_c = offset_c
  end

  def time
    time = Time.new
    day = time.day.to_s
    month = time.month.to_s.rjust(2, "0")
    year = time.year.to_s.slice(-2..-1)
    temp = day + month + year
    temp
  end

  def offset_full
    offset = ((self.time.to_i) ** 2).to_s
    offset.split(//).last(4).join
  end

  def offset_a
    offset_full[0].to_i
  end

  def offset_b
    offset_full[1]
  end

  def offset_c
    offset_full[2].to_i
  end

  def offset_d
    offset_full[3].to_i
  end

end

date = Date.new
binding.pry
""
