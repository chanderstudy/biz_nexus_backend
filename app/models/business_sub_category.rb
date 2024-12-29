class BusinessSubCategory < ApplicationRecord
  has_many :business_cards, -> { where('id = ANY (business_sub_category_ids)') }, class_name: 'BusinessCard'

  validates :name, presence: true, length: { maximum: 128 }
  validate :must_have_business_categories
  has_one_attached :logo
  has_one_attached :banner
  before_save :set_default_priority

  belongs_to :business_category, optional: true

  scope :for_category, ->(category_id) { where('? = ANY(business_category_ids)', category_id) }

  def self.ransackable_attributes(auth_object = nil)
    ["business_category_id", "created_at", "id", "name", "updated_at"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["business_cards", "business_category"]
  end

  # Method to fetch associated categories
  def business_categories
    BusinessCategory.where(id: business_category_ids)
  end

  def logo_url
    Rails.application.routes.url_helpers.rails_blob_url(logo) if logo.attached?
  end

  def banner_url
    Rails.application.routes.url_helpers.rails_blob_url(banner) if banner.attached?
  end

  private

  def set_default_priority
    self.priority ||= 0
  end

  def must_have_business_categories
    errors.add(:business_category_ids, "must have at least one category") if business_category_ids.blank? || business_category_ids.all?(&:blank?)
  end
end
