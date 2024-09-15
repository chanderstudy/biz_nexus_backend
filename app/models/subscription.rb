class Subscription < ApplicationRecord
  has_one :order, dependent: :destroy

  enum status: %i[deactivate active]
end
