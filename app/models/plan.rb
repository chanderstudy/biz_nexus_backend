class Plan < ApplicationRecord
  has_one_attached :logo
  has_one_attached :banner
  has_one :order, dependent: :destroy

  enum status: %i[deactivate active]
end
