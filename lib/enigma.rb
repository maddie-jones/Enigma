require './lib/message'
require './lib/key'
require './lib/shift'
require './lib/encryptor'
class Enigma

  def encrypt(message, key = nil, date = nil)
    message = Message.new(message).cell_index_values
    shift = Shift.new(key, date)
    shift= Shift.new(key, date)
    encryptor = Encryptor.new(message, shift)
    encrypted = { encryption: encryptor.new_encrypted_message(1), key: shift.key, date: shift.date}
  end

  def decrypt(message, key = nil, date = nil)
    message = Message.new(message).cell_index_values
    shift = Shift.new(key, date)
    shift= Shift.new(key, date)
    encryptor = Encryptor.new(message, shift)
     { decryption: encryptor.new_encrypted_message(-1), key: key, date: shift.date}
  end

end
