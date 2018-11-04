class Encryptor

  def initialize(indexed_message, shift, alph = ("a".."z").to_a << " ")
    @indexed_message = indexed_message
    @shift = shift.shift
    @alph = alph
  end

  def new_encrypted_message
     new_index_message.flatten.map do |index_cell|
       if index_cell.class == Integer
         @alph[index_cell % 27]
       else
         index_cell
       end
     end.join
  end

  def new_index_message
    @indexed_message.map do |indexed_cell|
      indexed_cell.map.with_index do |cell, index|
        if cell.class == Integer
          cell + @shift.values[index]
        else
          cell
        end
      end
    end
  end
end
