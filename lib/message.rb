
class Message

  def initialize(message)
    @message = message.downcase
  end

  def split_cells
    split_message = []
    @message.chars.each_slice(4) { |cell| split_message << cell}
    split_message
  end


  def cell_index_values
    split_cells.map do |split_cell|
      alph = ("a".."z").to_a << " "
      split_cell.map do |letter|
        if alph.include?(letter) == false
          letter
        else
          alph.index(letter)
        end
      end
    end
  end
end
# plus = 9
# nothing = ["N", "O", "T", "H", "I", "N", "G"]
# alphabet = ('A'..'Z').to_a
# # => ["A", "B", "C", "D", "E", ..., "Z"]
# nothing.map { |d| alphabet.index(d) + 1 + plus }
# # => [23, 24, 29, 17, 18, 23, 16]
