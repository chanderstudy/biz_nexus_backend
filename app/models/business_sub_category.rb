# app/models/business_sub_category.rb
class BusinessSubCategory < ApplicationRecord
  has_many :business_cards
  validates :name, presence: true, length: { maximum: 128 }
  validate :must_have_business_categories

  def self.ransackable_attributes(auth_object = nil)
    ["business_category_id", "created_at", "id", "name", "updated_at"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["business_cards", "business_category"]
  end

  def business_categories
    BusinessCategory.where(id: business_category_ids)
  end

  private

  def must_have_business_categories
    errors.add(:business_category_ids, "must have at least one category") if business_category_ids.blank? || business_category_ids.all?(&:blank?)
  end
end
