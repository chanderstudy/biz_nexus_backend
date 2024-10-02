class SocialMediaLink < ApplicationRecord
  # enum platform: {
  #   facebook: 0,
  #   youtube: 1,
  #   instagram: 2,
  #   justdial: 3,
  #   linkedin: 4,
  #   other: 5
  # }

  enum status: {
    deactivate: 0,
    active: 1
  }

  belongs_to :linkable, polymorphic: true
  # validates :platform, presence: true
  validates :status, presence: true
  validates :url, presence: true
end
