require './lib/encryptor.rb'


class Encrypt
	args = *ARGV

	encrypt_instance = Encryptor.new

	filename = ARGV[0]

	raw_text = File.read(filename)

	edited_raw_text = raw_text.gsub("\n", " ")

	encrypt_instance.encrypt(edited_raw_text)

	output = encrypt_instance.encrypted.join

	encrypted_filename = ARGV[1]

	encrypted = open(encrypted_filename, "w")

	File.write(encrypted_filename, output)
	puts "Created '#{encrypted_filename}' with the key #{encrypt_instance.key.key}"


end

