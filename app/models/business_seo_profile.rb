# app/models/business_seo_profiles.rb
class BusinessSeoProfile < ApplicationRecord
  has_one :business_card
  has_many_attached :images

  # Validations
  validates :active, inclusion: { in: [true, false] }
  validates :keywords, length: { maximum: 512 }, allow_blank: true
  validates :meta_tag, length: { maximum: 256 }, allow_blank: true
  validates :description, length: { maximum: 256 }, allow_blank: true

  def self.ransackable_attributes(auth_object = nil)
    ["active", "created_at", "description", "id", "keywords", "meta_tag", "updated_at"]
  end
end
