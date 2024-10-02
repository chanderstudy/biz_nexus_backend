class BusinessCard < ApplicationRecord
  # Associations for location
  belongs_to :state, foreign_key: :state_id, primary_key: :state_id
  belongs_to :district, foreign_key: :district_id, primary_key: :dist_id
  belongs_to :city, foreign_key: :city_id, primary_key: :city_id
  belongs_to :area, foreign_key: :area_id, primary_key: :area_id
  belongs_to :business_sub_category
  belongs_to :portal

  has_one :business_seo_profile, dependent: :destroy  # Added dependent destroy
  has_one :social_media_profile, dependent: :destroy  # Added dependent destroy
  has_many :faqs, as: :faqable, dependent: :destroy  # Ensure FAQs are destroyed
  has_many :documents, as: :documentable, dependent: :destroy  # Ensure documents are destroyed

  BCARD_TYPES = %w[free paid].freeze
  enum bcard_type: %i[free paid]
  enum status: %i[deactivate active]
  enum bank_type: %i[saving current]

  # Validations
  validates :name, presence: true, length: { maximum: 128 }

  accepts_nested_attributes_for :business_sub_category, allow_destroy: true
  accepts_nested_attributes_for :business_seo_profile, allow_destroy: true
  accepts_nested_attributes_for :social_media_profile, allow_destroy: true
  accepts_nested_attributes_for :faqs, allow_destroy: true  # Added for FAQs
  accepts_nested_attributes_for :documents, allow_destroy: true  # Added for Documents

  # Ransack configuration
  def self.ransackable_attributes(auth_object = nil)
    [
      "name", "owner_name", "email", "address", "landmark",
      "mobile", "latitude", "longitude", "bcard_type", "bcard_power",
      "status", "seo_active", "website", "bank_account",
      "bank_ifsc", "bank_type", "qrcode_active", "qrcode_file",
      "created_at", "updated_at", "state_id", "district_id",
      "city_id", "area_id"
    ]
  end

  def self.ransackable_associations(auth_object = nil)
    [
      "state", "district", "city", "area",
      "business_category", "business_sub_category",  # Reverted to belongs_to
      "business_seo_profile", "social_media_profile"
    ]
  end
end
