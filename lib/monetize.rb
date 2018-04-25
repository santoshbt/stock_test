module Monetize
  require 'money'

  def dollar_to_cents(dollar, currency = "EUR")
    cents = (dollar.to_r * 100).to_i
    money = Money.new(cents, currency)
    {value_cents: money.cents, currency: money.currency.iso_code}
  end
end
