class Crypto < ApplicationRecord
  validates :symbol, presence: true
  validates :cost_per, presence: true
  validates :amount_owned, presence: true
  validates_numericality_of :cost_per, :greater_than => 0
  validates_numericality_of :amount_owned, :greater_than => 0
  validate :price_is_valid_decimal_precision

  private

  def price_is_valid_decimal_precision
    errors.add(:cost_per, "There should only be two digits at most after the decimal point.") if cost_per.to_f != cost_per.to_f.round(2)
    errors.add(:amount_owned, "There should only be two digits at most after the decimal point.") if amount_owned.to_f != amount_owned.to_f.round(2)
  end
end