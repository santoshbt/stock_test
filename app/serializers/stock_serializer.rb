class StockSerializer < ActiveModel::Serializer
  attributes :id, :name, :bearer, :market_price

  def bearer
    object.bearer
  end

  def market_price
    object.market_price
  end
end
