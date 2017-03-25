class Date
  attr_reader :time

  def initialize
  end

  def time
    time = Time.new
    day = time.day.to_s
    month = time.month.to_s.rjust(2, "0")
    year = time.year.to_s.slice(-2..-1)
    temp = day + month + year
    temp
  end

  def offset
    offset = ((self.time.to_i) ** 2).to_s
    offset.split(//).last(4).join
  end
end
