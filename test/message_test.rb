require_relative 'test_helper'
require './lib/message'

class MessageTest < Minitest::Test

  def setup
    @message = Message.new("Hello world!")
  end

  def test_it_exists
    assert_instance_of Message, @message
  end

  def test_it_can_be_split_by_four
    assert_equal ["hell", "o wo", "rld!"], @message.split
  end

  def test_each_split_cell
    assert_equal [["h", "e", "l", "l"], ["o", " ", "w", "o"], ["r", "l", "d", "!"]], @message.split_cells
  end

  def test_it_can_assign_apha_intex_values
      assert_equal [7, 8, 26, 4], @message.cell_index_values
  end

end
