class Stock < ApplicationRecord
  acts_as_paranoid

  belongs_to :bearer
  belongs_to :market_price

  validates :name, presence: true
  attr_accessor :bearer_name, :currency, :value_cents

  before_validation :set_attributes

  protected

  def set_attributes
    StockAttrs.new({bearer_name: bearer_name,
                    currency: currency,
                    value_cents: value_cents,
                    stock: self}).set_sttributes
  end
end
