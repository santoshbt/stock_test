require 'rails_helper'

RSpec.describe Stock, type: :model do
  before do
    @stock = FactoryGirl.create(:stock)
  end

  describe "Validation" do
    it 'can be created' do
      expect(@stock).to be_valid
    end

    it 'has a valid name' do
      @stock.name = "Stock One"
      expect(@stock).to be_valid
    end

    it 'cannot be created withoud a valid name' do
      @stock.name = nil
      expect(@stock).to_not be_valid
    end
  end

  describe "Association" do
    describe Stock do
      it "belongs to a bearer" do
        should belong_to(:bearer)
      end

      it "references a market price" do
        should belong_to(:market_price)
      end
    end
  end

end
