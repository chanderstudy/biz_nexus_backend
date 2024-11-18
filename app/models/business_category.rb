class BusinessCategory < ApplicationRecord
  # has_many :business_sub_categories, foreign_key: :business_category_ids, primary_key: :id
  validates :name, presence: true, length: { maximum: 128 }
  has_one_attached :logo

  def business_sub_categories
    BusinessSubCategory.where('? = ANY(business_category_ids)', id)
  end

  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "id", "name", "updated_at"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["business_cards", "business_sub_categories"]
  end

  def logo_url
    Rails.application.routes.url_helpers.rails_blob_url(logo) if logo.attached?
  end
end
