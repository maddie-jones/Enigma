require_relative 'test_helper.rb'
require './lib/encryptor'

class EncryptorTest < Minitest::Test
  def test_it_exists
    indexed_message = [[7, 4, 11, 11], [14, 26, 22, 14], [17, 11, 3, "!"]]
    shift = mock("shift")
    shift.expects(:shift).returns({"A" => 3, "B" => 27, "C" => 73, "D" => 20})
    encryptor = Encryptor.new(indexed_message, shift)

    assert_instance_of Encryptor, encryptor
  end

  def test_it_can_generate_encrypted_message
    indexed_message = [[7, 4, 11, 11], [14, 26, 22, 14], [17, 11, 3, "!"]]
    shift = mock("shift")
    shift.expects(:shift).returns({"A" => 3, "B" => 27, "C" => 73, "D" => 20})
    encryptor = Encryptor.new(indexed_message, shift)

    assert_equal "keder ohulw!", encryptor.new_encrypted_message("encrypt")
  end

  def test_it_can_generate_new_index_message
    indexed_message = [[7, 4, 11, 11], [14, 26, 22, 14], [17, 11, 3, "!"]]
    shift = mock("shift")
    shift.expects(:shift).returns({"A" => 3, "B" => 27, "C" => 73, "D" => 20})
    encryptor = Encryptor.new(indexed_message, shift)

    assert_equal [[10, 31, 84, 31], [17, 53, 95, 34], [20, 38, 76, "!"]] , encryptor.new_index_message("encrypt")
  end

  def test_it_can_generate_decrypted_message
    indexed_message = [[10, 4, 3, 4], [17, 26, 14, 7], [20, 11, 22, "!"]]
    shift = mock("shift")
    shift.expects(:shift).returns({"A" => 3, "B" => 27, "C" => 73, "D" => 20})
    encryptor = Encryptor.new(indexed_message, shift)

    assert_equal "hello world!", encryptor.new_encrypted_message("decrypt")
  end

  def test_it_can_generate_new_index_message
    indexed_message = [[10, 4, 3, 4], [17, 26, 14, 7], [20, 11, 22, "!"]]
    shift = mock("shift")
    shift.expects(:shift).returns({"A" => 3, "B" => 27, "C" => 73, "D" => 20})
    encryptor = Encryptor.new(indexed_message, shift)

    assert_equal [[13, 31, 76, 24], [20, 53, 87, 27], [23, 38, 95, "!"]] , encryptor.new_index_message("encrypt")
  end

end
