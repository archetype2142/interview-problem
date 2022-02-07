require 'checkout'

describe Checkout do
  subject(:checkout) { described_class.new }
  let(:basket) { Basket.new }

  context "initialization" do
    it "total is zero" do
      expect(checkout.total).to eq "£0.00"
    end
  end
end
