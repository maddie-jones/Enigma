class Encryptor

  def initialize(indexed_message, shift)
    @indexed_message = indexed_message
    @shift = shift.shift
  end

  def new_encrypted_message
    @indexed_message.map do |indexed_cell|
      new_message_indexes = []
      index_zero = if indexed_cell[0].class == Integer
         new_message_indexes << indexed_cell[0] + @shift["A"]
       else
         new_message_indexes << indexed_cell[0]
       end

      if indexed_cell[1].class == Integer
         new_message_indexes << indexed_cell[1] + @shift["B"]
       else
         new_message_indexes << indexed_cell[1]
       end

      if indexed_cell[2].class == Integer
         new_message_indexes << indexed_cell[2] + @shift["C"]
       else
         new_message_indexes << indexed_cell[2]
       end

      if indexed_cell[3].class == Integer
         new_message_indexes << indexed_cell[3] + @shift["D"]
       else
         new_message_indexes << indexed_cell[3]
       end
       new_message_indexes   
    end

  end
end
