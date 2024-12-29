class Service < ApplicationRecord
  has_and_belongs_to_many :business_cards
  has_one_attached :logo
  has_one_attached :banner
  before_save :set_default_priority

  def self.ransackable_attributes(auth_object = nil)
    ["title", "description", "priority", "status", "created_at", "updated_at"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["business_cards"]
  end

  def set_default_priority
    self.priority ||= 0
  end

  def logo_url
    Rails.application.routes.url_helpers.rails_blob_url(logo) if logo.attached?
  end

  def banner_url
    Rails.application.routes.url_helpers.rails_blob_url(banner) if banner.attached?
  end
end
