require_relative 'test_helper'
require './lib/message'

class MessageTest < Minitest::Test

  def setup
    @message = Message.new("Hello world!")
  end

  def test_it_exists
    assert_instance_of Message, @message
  end

  def test_each_split_cell
    assert_equal [["h", "e", "l", "l"], ["o", " ", "w", "o"], ["r", "l", "d", "!"]], @message.split_cells
  end

  def test_it_can_assign_apha_intex_values
    assert_equal [[7, 4, 11, 11], [14, 26, 22, 14], [17, 11, 3, "!"]], @message.cell_index_values
  end

  def test_in_can_split_messages_not_divisible_by_four
    message_2 = Message.new("Hello friends!")

    assert_equal [["h", "e", "l", "l"], ["o", " ", "f", "r"], ["i", "e", "n", "d"], ["s", "!"]], message_2.split_cells
  end

end
