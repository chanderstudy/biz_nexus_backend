class BusinessCategory < ApplicationRecord
  has_many :business_sub_categories
  validates :name, presence: true, length: { maximum: 128 }

  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "id", "name", "updated_at"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["business_cards", "business_sub_categories"]
  end
end
