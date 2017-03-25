def key_generator(length = 4)
  chars = *(0..9)
  (0..length).map {chars.sample}.join
end
