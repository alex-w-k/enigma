require './lib/cracker'
require './lib/keygen'

class Crack

	args = *ARGV

	cracker_instance = Cracker.new

	filename = ARGV[0]
	date = ARGV[2]

	if date.nil?
		date = KeyGen.new.time
	end

	encrypted = File.read(filename)

	key = cracker_instance.key

	cracker_instance.crack(encrypted, date)

	output = cracker_instance.decrypted.join

	cracked_filename = ARGV[1]


	decrypted = open(cracked_filename, "w")

	File.write(cracked_filename, output)
	puts "Created '#{cracked_filename}' with the key #{key.key}"


end
