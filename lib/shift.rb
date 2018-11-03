require 'time'
require './lib/key'
class Shift

  attr_reader :key, :date

  def initialize(key , date = nil)
    @key =  key.number
    @date = date || Time.now.strftime("%d%m%y")
  end

  def key_offset
    {
      "A"=> @key[0..1].to_i,
      "B" => @key[1..2].to_i,
      "C" => @key[2..3].to_i,
      "D" => @key[3..4].to_i
    }
    # refactor as loop with group_by
  end

  def date_offset
    date_squared = @date.to_i ** 2
    date_squared_index = date_squared.to_s.length - 1
    square_four_digit = date_squared.to_s[-4..date_squared_index]
    {
      "A"=> square_four_digit[0].to_i,
      "B" => square_four_digit[1].to_i,
      "C" => square_four_digit[2].to_i,
      "D" => square_four_digit[3].to_i
    }
  end

  def shift
    date_offset.inject({}) do |total_offset,(key, value)|
      total_offset[key] = key_offset[key] + value
      total_offset
    end
  end

end
