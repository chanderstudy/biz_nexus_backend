# app/models/business_card.rb
class BusinessCard < ApplicationRecord
  belongs_to :state, foreign_key: :state_id, primary_key: :state_id
  belongs_to :district, foreign_key: :district_id, primary_key: :dist_id
  belongs_to :city, foreign_key: :city_id, primary_key: :city_id
  belongs_to :area, foreign_key: :area_id, primary_key: :area_id

  # Associations with other tables
  belongs_to :business_category
  belongs_to :business_sub_category
  belongs_to :business_seo_profile
  belongs_to :social_media_profile
  belongs_to :portal
  has_many :faqs, as: :faqable
  has_many :documents, as: :documentable, dependent: :destroy

  BCARD_TYPES = %w(free, paid).freeze
  # enum bcard_type: %i[form email text phone]
  enum bcard_type: %i[free paid]
  enum status: %i[deactivate active]
  enum bank_type: %i[saving current]

  validates :name, presence: true, length: { maximum: 128 }

  # Ransack configuration
  def self.ransackable_attributes(auth_object = nil)
    [
      "name", "owner_name", "email", "address", "landmark",
      "mobile", "latitude", "longitude", "bcard_type", "bcard_power",
      "pstatus", "status", "seo_active", "website", "bank_account",
      "bank_ifsc", "bank_type", "qrcode_active", "qrcode_file",
      "created_at", "updated_at", "state_id", "district_id",
      "city_id", "area_id"
    ]
  end

  def self.ransackable_associations(auth_object = nil)
    [
      "state", "district", "city", "area",
      "business_category", "business_sub_category",
      "business_seo_profile", "social_media_profile"
    ]
  end
end
