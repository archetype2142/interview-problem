require 'basket'

describe Basket do
  let(:item1) { Item.new("001", "Lavender heart", 9.25) }
  let(:item2) { Item.new("002", "Personalised cufflinks", 45) }
  let(:item3) { Item.new("003", "Kids T-shirt", 19.95) }
  subject(:basket) { described_class.new() }

  it "adds an item" do
    basket.add(item1)
    expect(basket.count).to eq 1
  end

  it "calculates sum of items" do
    basket.add(item1)
    basket.add(item2)
    basket.add(item3)
    expect(basket.sum).to eq 74.20
  end

  it "changes the unit cost of a specified item code, for each instance in basket" do
    basket.add(item1)
    basket.add(item2)
    basket.add(item1)
    basket.change_price("001", 8.50)
    expect(basket.sum).to eq 62.00
  end
end
