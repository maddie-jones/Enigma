require_relative 'test_helper.rb'
require './lib/enigma'

class EnigmaTest < Minitest::Test

  def setup
    @enigma = Enigma.new
  end

  def test_it_exists
    assert_instance_of Enigma, @enigma
  end

  def test_it_can_encrypt
    expected = {
      encryption: "keder ohulw!",
      key: "02715",
      date: "040895"
    }
    assert_equal expected, @enigma.encrypt("Hello world!", "02715", "040895")
  end

  def test_it_can_encrypt_with_just_message
    Key.any_instance.stubs(:generate_number).returns("32440")
    expected = { encryption: "vkdbbfoeerw!",
      key: "32440",
      date: Time.now.strftime("%d%m%y")
    }
    assert_equal expected, @enigma.encrypt("Hello world!")
  end


  def test_it_can_decrypt
    expected = {
      decryption: "hello world!",
      key: "02715",
      date: "040895"
    }

    assert_equal expected, @enigma.decrypt("keder ohulw!", "02715", "040895")
  end

  def test_it_can_decrypt_with_only_key
    expected = {
      decryption: "hello world!",
      key: "02715",
      date: Time.now.strftime("%d%m%y")
    }
    encrypted = @enigma.encrypt("hello world!", "02715")

    assert_equal expected, @enigma.decrypt(encrypted[:encryption], "02715")
  end


end
