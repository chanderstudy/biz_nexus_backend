class Order < ApplicationRecord
  belongs_to :agent, class_name: 'User'
  belongs_to :payment_received_by, class_name: 'User'
  belongs_to :placed_by, class_name: 'User'
  belongs_to :transaction_record, class_name: 'Transaction', foreign_key: 'transaction_id'
  belongs_to :user
  belongs_to :plan
  belongs_to :subscription, optional: true

  enum status: %i[deactivate active]
  validates :order_invoice, presence: true, uniqueness: true
  validates :agent_id, presence: true
  validates :user_id, presence: true
  validates :plan_id, presence: true
  validates :mrp, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :discount, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :gst, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :net_amount, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  before_save :calculate_net_amount

  private

  def calculate_net_amount
    self.net_amount = mrp - discount + extra_charge + gst
  end
end
