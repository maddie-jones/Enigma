require './lib/message'
require './lib/key'
require './lib/shift'
require './lib/encryptor'
class Enigma

  def encrypt(message, key = nil, date = nil)
    message = Message.new(message)
    shift = Shift.new(key, date)
    indexed_message = message.cell_index_values
    shift= Shift.new(key, date)
    encryptor = Encryptor.new(indexed_message, shift)
    encrypted = { encryption: encryptor.new_encrypted_message("encrypt"),
      key: shift.key,
      date: shift.date
      }
  end

  def decrypt(message, key = nil, date = nil)
    message = Message.new(message)
    shift = Shift.new(key, date)
    indexed_message = message.cell_index_values
    shift= Shift.new(key, date)
    encryptor = Encryptor.new(indexed_message, shift)
     { decryption: encryptor.new_encrypted_message("decrypt"),
      key: key,
      date: shift.date
      }
  end

end
