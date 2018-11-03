
class Message
  def initialize(message)
    @message = message.downcase
  end

  def split
    @message.scan(/..../)
  end

  def split_cells
    a = split.map do |cell|
      cell.chars
    end
  end

  def cell_index_values
      alph = ("a".."z").to_a << " "
    split_cells.map do |split_cell|
      alph
      plus = 9
# nothing = ["N", "O", "T", "H", "I", "N", "G"]
# alphabet = ('A'..'Z').to_a
# # => ["A", "B", "C", "D", "E", ..., "Z"]
# nothing.map { |d| alphabet.index(d) + 1 + plus }
# # => [23, 24, 29, 17, 18, 23, 16]
    end
  end

end
