class Coupon < ApplicationRecord
  enum type: %i[everyone seasonal agent user]
  enum status: %i[deactivate active]
  has_one_attached :logo
  has_one_attached :banner

  validates :code, presence: true, uniqueness: true, length: { maximum: 7 }
end
