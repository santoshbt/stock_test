class StocksController < ApplicationController
  before_action :set_stock, only: [:show, :update, :destroy]
  def index
    @stocks = Stock.includes(:bearer, :market_price)
    render json: @stocks, status: 200
  end

  def create
    unless stock_params.values.include? "invalid"
      @stock = Stock.new stock_params
      if @stock.save
        render json: @stock, status: 200
      else
        render json: {error: @stock.errors.full_messages}, status: :unprocessable_entity
      end
    else
      render json: {error: invalid_params}, status: :unprocessable_entity
    end
  end

  def update
    if @stock.update(stock_params)
      render json: @stock, status: 200
    else
      render json: {error: @stock.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def destroy
    if @stock && @stock.destroy
      render json: { message: "Stock Deleted"}, status: 200
    else
      render json: {error: @stock.errors.full_messages}, status: :unprocessable_entity
    end
  end

  private
  def stock_params
    params.require(:stock).permit(:name, :bearer_name, :currency, :value_cents)
  end

  def set_stock
    @stock = Stock.find params[:id]
  end

  def invalid_params
    invalid_params_hash = {}
    stock_params.each do |k, v|
      invalid_params_hash["#{k}"] = ["is invalid"] if v == "invalid"
    end
    return invalid_params_hash
  end
end
