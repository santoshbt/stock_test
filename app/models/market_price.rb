class MarketPrice < ApplicationRecord
  has_many :stocks

  validates :currency, :value_cents, presence: true
  validates :value_cents, numericality: { only_integer: true }
  validates :currency, uniqueness: { scope: :value_cents, message: "Same currency and value are already taken." }
end
