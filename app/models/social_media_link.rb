class SocialMediaLink < ApplicationRecord
  enum social_media_type: {
    facebook: 0,
    instagram: 1,
    twitter: 2,
    youtube: 3,
    linkedin: 4,
    pinterest: 5,
    youtube_video_tour: 6
  }

  enum status: {
    deactivate: 0,
    active: 1
  }

  belongs_to :linkable, polymorphic: true
  # validates :platform, presence: true
  validates :status, presence: true
  validates :url, presence: true
end
