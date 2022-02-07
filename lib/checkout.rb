class Checkout
  attr_reader :basket, :promo_rules

  def initialize(promo_rules = nil)
    @basket = Basket.new
    @promo_rules = promo_rules
  end

  def scan(item)
    basket.add(item)
  end

  def total
    calc = Calculations.new(basket, promo_rules)
    format_price(calc.total)
  end

  private
  def format_price(price)
    "£#{format('%.2f', price)}"
  end
end
