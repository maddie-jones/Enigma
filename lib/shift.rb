class Shift

  attr_reader :key, :date

  def initialize(key, date)
    @key = key
    @date = date
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



end
