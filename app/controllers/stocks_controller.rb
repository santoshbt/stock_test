class StocksController < ApplicationController
  def index

  end

  def create
    unless stock_params.values.include? "invalid"
      @stock = Stock.new stock_params
      if @stock.save
        render json: @stock, status: "200"
      else
        render json: {error: @stock.errors.full_messages}, status: :unprocessable_entity
      end
    else
      render json: {error: invalid_params}, status: :unprocessable_entity
    end
  end

  private
  def stock_params
    params.require(:stock).permit(:name, :bearer_name, :currency, :value_cents)
  end

  def invalid_params
    invalid_params_hash = {}
    stock_params.each do |k, v|
      invalid_params_hash["#{k}"] = ["is invalid"] if v == "invalid"
    end
    return invalid_params_hash
  end
end
