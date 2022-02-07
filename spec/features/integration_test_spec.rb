describe "integration test" do
  let(:item1) { Item.new("001", "Lavender heart", 9.25) }
  let(:item2) { Item.new("002", "Personalised cufflinks", 45.00) }
  let(:item3) { Item.new("003", "Kids T-shirt", 19.95) }
  
  let(:promo1) { Promotion.new(id: :promo1, type: "multiple_buy", params: { code: "001", quantity: 2, promo_price: 8.50 }) }
  let(:promo2) { Promotion.new(id: :promo2, type: "vol_discount", params: { min_purchase: 60, discount: 0.1 }) }
  
  let(:rules) { PromotionRules.new(promo1, promo2) }
  let(:co) { Checkout.new(rules) }

  before do
    @discount = 0.1
  end

  def format_price(price)
    "£#{format('%.2f', price)}"
  end

  context("checkout") do
    it "sum of items with no promo rules fulfilled" do
      co = Checkout.new
      co.scan(item1)
      co.scan(item2)
      co.scan(item3)

      expect(co.total).to eq format_price(item1.price+item2.price+item3.price)
    end

    it "basket with code 001 fulfilling bundle promo gets discouted unit price" do
      co.scan(item1)
      co.scan(item1)

      expect(co.total).to eq format_price(2*item1.price)
    end

    it "basket get 2 items bundle discount AND discount volume" do
      co.scan(item1)
      co.scan(item1)
      co.scan(item2)
      co.scan(item2)

      expect(co.total).to eq format_price((2*item1.price+2*item2.price)*(1-@discount))
    end

    it "same basket as above in different order gets same result" do
      co.scan(item1)
      co.scan(item2)
      co.scan(item1)
      co.scan(item2)

      expect(co.total).to eq format_price((2*item1.price+2*item2.price)*(1-@discount))
    end
  end

  context "test data" do
    it "example 1" do
      co.scan(item1)
      co.scan(item2)
      co.scan(item3)
      expect(co.total).to eq format_price((item1.price+item2.price+item3.price)*(1-@discount))
    end

    it "example 2" do
      co.scan(item1)
      co.scan(item3)
      co.scan(item1)
      expect(co.total).to eq format_price(2*item1.price+item3.price)
    end

    it "example 3" do
      co.scan(item1)
      co.scan(item2)
      co.scan(item1)
      co.scan(item3)
      expect(co.total).to eq format_price((2*item1.price+item2.price+item3.price)*(1-@discount))
    end
  end
end
