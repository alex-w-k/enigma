require './lib/decryptor'

class Decrypt

	args = *ARGV

	decrypt_instance = Decryptor.new

	filename = ARGV[0]

	key = ARGV[2]

	encrypted = File.read(filename)

	decrypt_instance.decrypt(encrypted, key)

	output = decrypt_instance.decrypted.join

	decrypted_filename = ARGV[1]


	decrypted = open(decrypted_filename, "w")

	File.write(decrypted_filename, output)
	puts "Created '#{decrypted_filename}' with the key #{key}"


end
