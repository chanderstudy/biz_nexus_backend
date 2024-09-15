class Subscription < ApplicationRecord
  has_one_attached :logo
  has_one_attached :banner

  enum status: %i[deactivate active]
end
