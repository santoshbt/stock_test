require 'rails_helper'

RSpec.describe MarketPrice, type: :model do
  before do
    @marketprice = FactoryGirl.create(:first_market_price)
  end

  describe "Validation" do
    it "can be created" do
      expect(@marketprice).to be_valid
    end

    it "cannot be created without a valid currency and marketprice" do
      @marketprice.currency = nil
      @marketprice.value_cents = "2we123"
      expect(@marketprice).to_not be_valid
    end

    it "cannot have more that one value in cents for any currency" do
      @second_marketprice = FactoryGirl.create(:second_market_price)
      @third_market_price = FactoryGirl.create(:third_market_price)
      @third_market_price.value_cents = 2530      #### this is invalid since second market price already has the same value for USD
      expect(@third_market_price).to_not be_valid
    end
  end

  describe "Association" do
    describe MarketPrice do
      it "has many stocks" do
        should have_many(:stocks)
      end
    end
  end
end
