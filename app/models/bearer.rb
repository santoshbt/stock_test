class Bearer < ApplicationRecord
  has_many :stocks

  validates :name, presence: true
end
