# app/models/social_media_profile.rb
class SocialMediaProfile < ApplicationRecord
  has_one :business_card

  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "facebook", "id", "instagram", "linkedin", "other", "updated_at", "youtube"]
  end
end
