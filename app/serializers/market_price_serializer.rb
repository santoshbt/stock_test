class MarketPriceSerializer < ActiveModel::Serializer
  attributes :id, :currency, :value_cents
end
