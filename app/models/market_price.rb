class MarketPrice < ApplicationRecord
  # require 'money'
  has_many :stocks

  validates :currency, :value_cents, presence: true
  validates :value_cents, numericality: { only_integer: true }
  validates :currency, uniqueness: { scope: :value_cents, message: "Same currency and value are already taken." }

  # before_validation :convert_to_cents

  def convert_to_cents
    p value_cents.inspect
    cents = (value_cents.to_r * 100).to_i

    money = Money.new(cents, currency)
    self.value_cents = money.cents
    self.currency = money.currency.iso_code
    # p self.value_cents.inspect
    # p "**************************"
  end
end
