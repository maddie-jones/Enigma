class Enigma

  def encrypt(message, key, date)
    message = Message.new(message)
    key = Key.new(key)
    date = Date.new(date)
  end
  
end
