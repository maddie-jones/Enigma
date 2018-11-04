require './lib/message'
require './lib/key'
require './lib/shift'
class Enigma

  def encrypt(message, key = nil, date = nil)
    message = Message.new(message)
    key = Key.new(key)
    shift = Shift.new(key, date)
  end

end
