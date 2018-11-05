require './lib/enigma'
require 'pry'
file = File.open(ARGV[0], "r")
file_2 = File.open(ARGV[1], "w")
message = file.read.split("\n")
enigma = Enigma.new
key = ARGV[2]
date = ARGV[3]
message.each do |line|
  file_2.puts(enigma.decrypt(line, key, date)[:decryption])
end

puts "Created #{ARGV[1]} with the key #{key} and date #{date}"
