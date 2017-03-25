def time
  time = Time.new
  day = time.day.to_s
  month = time.month.to_s
  year = time.year.to_s.slice(-2..-1)
  temp = day + month + year
  offset = ((temp.to_i) ** 2).to_s
  offset[-1..-3]
  time
end
