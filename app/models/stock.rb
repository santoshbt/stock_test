class Stock < ApplicationRecord
  acts_as_paranoid

  belongs_to :bearer
  belongs_to :market_price

  validates :name, presence: true
end
