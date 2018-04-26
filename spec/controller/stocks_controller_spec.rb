require 'rails_helper'

RSpec.describe StocksController, type: :controller do
  let(:stock) {FactoryGirl.create(:stock)}
  let(:bearer) {FactoryGirl.create(:bearer) }
  let(:second_bearer) {FactoryGirl.create(:second_bearer) }
  let(:market_price) {FactoryGirl.create(:first_market_price) }

  describe "GET /stocks/" do
    it "should return list with stocks" do
      10.times {|stock_index| FactoryGirl.create(:stock, name: "Stock #{stock_index}",
                                    bearer: bearer, market_price: market_price) }

      get :index, as: :json
      expect(response).to have_http_status(200)
      json_data = JSON.parse(response.body)
      expect(json_data[0]["name"]).to eq("Stock 0")

      expect(json_data[0]["bearer"]["id"]).to eq(1)
      expect(json_data[0]["bearer"]["name"]).to eq("John")

      expect(json_data[0]["market_price"]["id"]).to eq(1)
      expect(json_data[0]["market_price"]["currency"]).to eq("EUR")
      expect(json_data[0]["market_price"]["value_cents"]).to eq(1578)

      expect(json_data.count).to eq(10)

    end
  end

  describe "POST /stocks/" do
    context "with valid data" do
      it "should return stock and 200 OK" do
        stock_params = { stock: { name: "ABC Company", bearer_name: "Tina Rudwik", value_cents: "2000", currency: "EUR"} }
        post :create, as: :json, params: stock_params

        expect(response).to have_http_status(200)

        json_data = JSON.parse(response.body)
        expect(json_data["name"]).to eq(stock_params[:stock][:name])

        expect(json_data["bearer"]["id"]).to be(1)
        expect(json_data["bearer"]["name"]).to eq(stock_params[:stock][:bearer_name])

        expect(json_data["market_price"]["id"]).to be(1)
        expect(json_data["market_price"]["value_cents"]).to eq(2000)   #### Check it
        expect(json_data["market_price"]["currency"]).to eq(stock_params[:stock][:currency])

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
        current_stock = stock
        stock_params = { stock: {bearer_name: 'Jon'}, id: current_stock.id }
        patch :update, method: :patch, as: :json, params: stock_params

        expect(response).to have_http_status(200)
        json_data = JSON.parse(response.body)

        expect(json_data["name"]).to eq(current_stock.name)
        expect(json_data["bearer"]["name"]).to eq(stock_params[:stock][:bearer_name])
        expect(json_data["market_price"]["value_cents"]).to eq(current_stock.market_price.value_cents)
        expect(json_data["market_price"]["currency"]).to eq(current_stock.market_price.currency)
      end
    end

    context "with different market price" do
      it "should create new market price but keep bearer" do
        current_stock = stock
        stock_params = { stock: {currency: "USD", value_cents: 3000 }, id: current_stock.id }
        patch :update, method: :patch, as: :json, params: stock_params
        expect(response).to have_http_status(200)
        json_data = JSON.parse(response.body)

        expect(json_data["name"]).to eq(current_stock.name)
        expect(json_data["bearer"]["name"]).to eq(current_stock.bearer.name)
        expect(json_data["market_price"]["value_cents"]).to eq(3000)
        expect(json_data["market_price"]["currency"]).to eq(stock_params[:stock][:currency])
      end
    end

    context "with existing bearer" do
      it "should reference existing bearer to stock" do
        current_stock = stock
        other_bearer = second_bearer
        stock_params = { stock: {bearer_name: other_bearer.name}, id: current_stock.id }

        patch :update, method: :patch, as: :json, params: stock_params
        expect(response).to have_http_status(200)
        json_data = JSON.parse(response.body)

        expect(json_data["name"]).to eq(current_stock.name)
        expect(json_data["bearer"]["name"]).to eq(stock_params[:stock][:bearer_name])
        expect(json_data["market_price"]["value_cents"]).to eq(current_stock.market_price.value_cents)
        expect(json_data["market_price"]["currency"]).to eq(current_stock.market_price.currency)
      end
    end
  end

  describe "DELETE /stocks/:id" do
    context "with different bearer" do
      it "should create new bearer but keep market price" do
        current_stock = stock
        stock_params = { id: current_stock.id }

        delete :destroy, method: :delete, as: :json, params: stock_params
        expect(response).to have_http_status(200)
        json_data = JSON.parse(response.body)

        expect(Stock.count).to eq(0)
        expect(Bearer.count).to eq(1)
        expect(MarketPrice.count).to eq(1)
      end
    end
  end

end
