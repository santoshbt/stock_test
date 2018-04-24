require 'rails_helper'

RSpec.describe StocksController, type: :controller do

  describe "GET /stocks/" do
    it "should return list with stocks" do
    end
  end

  describe "POST /stocks/" do
    context "with valid data" do
      it "should return stock and 200 OK" do
      end
    end

    context "with invalid data" do
      it "should return 422 and fail to save" do

        params = { name: "invalid", bearer: "invalid", value: 19.39, currency: "EUR" }

        get :create, method: :post, params: params

        expect(response).to have_http_status(422)
        expect(JSON.parse(response.body)).to eq({"error"=>{"name"=>["is invalid"], "bearer"=>["is invalid"]}})
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
