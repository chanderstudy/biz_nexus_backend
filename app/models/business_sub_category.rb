# app/models/business_sub_category.rb
class BusinessSubCategory < ApplicationRecord
  belongs_to :business_category
  has_many :business_cards

  # Validations
  validates :name, presence: true, length: { maximum: 128 }

  def self.ransackable_attributes(auth_object = nil)
    ["business_category_id", "created_at", "id", "name", "updated_at"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["business_cards", "business_category"]
  end
end
