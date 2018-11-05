class Encryptor

  def initialize(indexed_message, shift, alph = ("a".."z").to_a << " ")
    @indexed_message = indexed_message
    @shift = shift.shift
    @alph = alph
  end

  def new_encrypted_message(direction)
    new_encrypted_letters(direction).join
  end

  def new_encrypted_letters(direction)
    new_index_message(direction).flatten.map do |index_cell|
      if index_cell.class == Integer
        @alph[index_cell % 27]
      else
        index_cell
      end
    end
  end

  def new_index_message(direction)
    @indexed_message.map do |indexed_cell|
      new_indexed_cell(direction, indexed_cell)
    end
  end

  def new_indexed_cell(direction, indexed_cell)
    indexed_cell.map.with_index do |cell, index|
      if cell.class == Integer
        cell + (@shift.values[index] * direction)
      else
        cell
      end
    end
  end
end
