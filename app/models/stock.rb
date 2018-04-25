class Stock < ApplicationRecord
  acts_as_paranoid
  include Monetize

  belongs_to :bearer
  belongs_to :market_price

  validates :name, presence: true
  attr_accessor :bearer_name, :currency, :value_cents

  before_validation :set_bearer, :set_market_price

  protected

  def set_bearer
    bearer_name = self.bearer_name
    self.bearer = Bearer.where(name: bearer_name).first_or_create unless bearer_name.blank?
  end

  def set_market_price
    money = self.dollar_to_cents(self.value_cents, self.currency)
    value_cents, currency = money[:value_cents], money[:currency]
    
    if currency && value_cents
      self.market_price = MarketPrice.where(currency: currency, value_cents: value_cents)
                                     .first_or_create
    end
  end
end
