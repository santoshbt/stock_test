require 'rails_helper'

RSpec.describe MarketPrice, type: :model do
  before do
    @bearer = FactoryGirl.create(:bearer)
  end

  describe "Validation" do
    it "can be created" do
      expect(@bearer).to be_valid
    end

    it "has a valid name" do
      @bearer.name = "Tina"
      expect(@bearer).to be_valid
    end

    it "cannot be created without a valid name" do
      @bearer.name = nil
      expect(@bearer).to_not be_valid
    end
  end

  describe "Association" do
    describe Bearer do
      it "has many stocks" do
        should have_many(:stocks)
      end
    end
  end
end
