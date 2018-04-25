require 'rails_helper'

RSpec.describe StocksController, type: :controller do

  describe "GET /stocks/" do
    it "should return list with stocks" do
    end
  end

  describe "POST /stocks/" do
    context "with valid data" do
      it "should return stock and 200 OK" do
        stock_params = { stock: { name: "ABC Company", bearer_name: "Tina Rudwik", value_cents: "20.00", currency: "EUR"} }
        post :create, as: :json, params: stock_params
        expect(response).to have_http_status(200)
        json_data = JSON.parse(response.body)

        expect(json_data["bearer_id"]).to be(1)
        expect(json_data["market_price_id"]).to be(1)

        expect(Stock.count).to eq(1)
        expect(Bearer.count).to eq(1)
        expect(MarketPrice.count).to eq(1)
      end
    end

    context "with invalid data" do
      it "should return 422 and fail to save" do
        stock_params = {stock: { name: "invalid", bearer_name: "invalid", value_cents: 19.39, currency: "EUR" } }
        post :create, method: :post, as: :json, params: stock_params
        expect(response).to have_http_status(422)
        expect(JSON.parse(response.body)).to eq({"error"=>{"name"=>["is invalid"], "bearer_name"=>["is invalid"]}})

        expect(Stock.count).to eq(0)
        expect(Bearer.count).to eq(0)
        expect(MarketPrice.count).to eq(0)

      end
    end
  end

  describe "PATCH /stocks/:id" do
    context "with different bearer" do
      it "should create new bearer but keep market price" do
      end
    end

    context "with different market price" do
      it "should create new market price but keep bearer" do
      end
    end

    context "with existing bearer" do
      it "should reference existing bearer to stock" do
      end
    end
  end

  describe "DELETE /stocks/:id" do
    context "with different bearer" do
      it "should create new bearer but keep market price" do
      end
    end
  end

end
