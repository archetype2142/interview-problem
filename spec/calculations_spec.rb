require 'calculations'

describe Calculations do
  let(:item1) { Item.new("001", "Lavender heart", 9.25) }
  let(:item2) { Item.new("002", "Personalised cufflinks", 45) }
  let(:item3) { Item.new("003", "Kids T-shirt", 19.95) }
  let(:promo1) { double(id: "promo1", type: "multiple_buy", params: { code: "001", quantity: 2, promo_price: 8.50 }) }
  let(:promo2) { double(id: "promo2", type: "vol_discount", params: { min_purchase: 60, discount: 0.1 }) }

  let(:basket) { Basket.new }
  let(:empty) { Basket.new }

  before do
    @promo_multiple = PromotionRules.new(promo1)
    @promo_vol = PromotionRules.new(promo2)

    basket.add(item1)
    basket.add(item2)
    basket.add(item1)
    basket.add(item3)
    basket.add(item2)
  end

  it "empty basket, cost is 0" do
    empty_basket = Calculations.new(empty, nil)
    expect(empty_basket.total).to eq 0
  end

  it "with no promo rules, basket is sum of items price" do
    basket_no_promos = Calculations.new(basket, nil)
    expect(basket_no_promos.total).to eq 128.45
  end

  it "applies vol_discount rule" do
    basket_vol = Calculations.new(basket, @promo_vol)
    expect(basket_vol.total).to be_within(0.006).of(115.61)
  end

  it "applies one multiple buy promo" do
    basket_promo_multiple = Calculations.new(basket, @promo_multiple)
    expect(basket_promo_multiple.total).to eq 126.95
  end
end
