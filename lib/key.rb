
class Key
  attr_reader :number

  def initialize(number = nil)
    @number = number || generate_number
  end

  def generate_number
    generated_number = rand(99999).to_s
    generated_number.rjust(5, "0")
  end

end
