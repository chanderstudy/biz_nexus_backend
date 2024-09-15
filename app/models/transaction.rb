class Transaction < ApplicationRecord
  enum payment_mode: %i[upi cash card internet_banking]
  enum status: %i[pending completed failed]

  validates :payment_mode, presence: true
  validates :amount, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :status, presence: true
end
