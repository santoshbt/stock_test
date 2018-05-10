class StockAttrs
  def initialize(params)
    @bearer_name = params[:bearer_name]
    @currency = params[:currency]
    @value_cents = params[:value_cents]
    @stock = params[:stock]
  end

  def set_sttributes
    set_bearer
    set_market_price
  end

  def set_bearer
    bearer_name = @bearer_name
    @stock.bearer = Bearer.where(name: bearer_name).first_or_create unless bearer_name.blank?
  end

  def set_market_price
    currency, value_cents = @currency, @value_cents
    if currency && value_cents
      @stock.market_price = MarketPrice.where(currency: currency, value_cents: value_cents)
                                     .first_or_create
    end
  end
end
