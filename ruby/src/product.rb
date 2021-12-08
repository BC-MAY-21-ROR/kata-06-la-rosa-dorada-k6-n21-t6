#item initialization
class Product
  attr_accessor :name, :sell_in, :quality

  def initialize(name, sell_in, quality)
    @quality = quality > 50 ? 50 : quality
    @sell_in = sell_in.negative? ? 0 : sell_in
    @name = name
  end

  def to_s
    "#{@name}, #{@sell_in}, #{@quality}"
  end
end