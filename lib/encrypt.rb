require './lib/encryptor.rb'


class Encrypt < Encryptor
  
  encrypt_message = Encryptor.new

  filename = ARGV[0]
  text = File.read(filename)
  encrypt_message.encrypt(text)

  encrypted_file = ARGV[1]
  message = encrypt_message.encrypt.join
  File.write(encrypted_file, message)

end
