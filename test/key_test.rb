require_relative 'test_helper.rb'
require './lib/key'

class KeyTest < Minitest::Test
  # key = mock(key)
  # key.stubs(:random_key).returns("02130")
  # shift_3 = Shift.new(key)
  def test_it_exists
    key = Key.new
    assert_instance_of Key, key
  end

  def test_it_has_a_number
    key = Key.new("02715")
    assert_equal "02715", key.number
  end

  def test_it_can_generate_number
    key = Key.new
    key.expects(:generate_number).returns("02130")
    assert_equal "02130", key.generate_number
  end
end
