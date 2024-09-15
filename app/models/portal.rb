class Portal < ApplicationRecord
  validates :portal_name, presence: true, length: { maximum: 128 }
  validates :portal_remark, length: { maximum: 512 }
  validates :portal_url, length: { maximum: 128 }
  validates :portal_msg, length: { maximum: 256 }

  enum portal_status: %i[deactivate active]
  has_many :business_cards

  def self.ransackable_attributes(auth_object = nil)
    ["portal_name", "portal_msg", "portal_remark", "portal_status", "portal_status", "created_at"]
  end

  def self.ransackable_associations(auth_object = nil)
    []
  end
end
