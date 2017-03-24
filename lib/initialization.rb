require "pry"

def time
  time = Time.new
  day = time.day.to_s
  month = time.month.to_s
  year = time.year.to_s.slice(-2..-1)
  temp = day + month + year
  offset = ((temp.to_i) ** 2)
  offset
end

def key_generator(length = 4)
  chars = *(0..9)
  (0..length).map {chars.sample}.join
end

binding.pry
""
