class Encryptor

  def initialize(indexed_message, shift)
    @indexed_message = indexed_message
    @shift = shift.shift
  end

end
