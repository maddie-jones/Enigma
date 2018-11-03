require_relative 'test_helper'
require './lib/shift'

class ShiftTest < Minitest::Test
  def setup
    @shift = Shift.new("02715","040895")
  end

  def test_it_exists
    assert_instance_of Shift, @shift
  end

  def test_it_has_key
    assert_equal "02715", @shift.key
  end

  def test_it_has_date
    assert_equal "040895", @shift.date
  end

  def test_it_can_make_key_into_offset
    expected = {"A"=> 02, "B" => 27, "C" => 71, "D" => 15}
    assert_equal expected, @shift.key_offset
  end

  def test_it_can_make_date_into_offset
    expected = {"A" => 1, "B" => 0, "C" => 2, "D" => 5}
    assert_equal expected, @shift.date_offset
  end

  def test_it_can_can_calculate_shift
    expected = {"A" => 3, "B" => 27, "C" => 73, "D" => 20}
    assert_equal expected, @shift.shift
  end

end
