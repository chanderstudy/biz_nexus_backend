# app/models/business_category.rb
class BusinessCategory < ApplicationRecord
  has_many :business_sub_categories
  has_many :business_cards

  # Validations
  validates :name, presence: true, length: { maximum: 128 }

  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "id", "name", "updated_at"]
  end
end
