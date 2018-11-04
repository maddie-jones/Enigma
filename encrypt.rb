require 'pry'
require './lib/enigma'
file = File.open(ARGV[0], "r")
message = file.read
enigma = Enigma.new
encrypted = enigma.encrypt(message)
