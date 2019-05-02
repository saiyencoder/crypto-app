module ApplicationHelper
  private

  def percentage_change(obj, percentage)
    case percentage
    when 1
      obj["quote"]["USD"]["percent_change_1h"]
    when 24
      obj["quote"]["USD"]["percent_change_24h"]
    when 7
      obj["quote"]["USD"]["percent_change_7d"]
    end
  end

  def price_value(obj)
    obj["quote"]["USD"]["price"].to_d
  end

  def c_name(obj)
    obj["name"]
  end

  def rank(obj)
    obj["cmc_rank"]
  end

  def calucate_profit_loss(coin,crypto)
    price_value(coin) * crypto.amount_owned - crypto.cost_per * crypto.amount_owned
  end
end
