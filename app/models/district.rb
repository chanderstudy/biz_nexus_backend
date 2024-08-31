# app/models/district.rb
class District < ApplicationRecord
  belongs_to :state
  has_many :cities, foreign_key: :dist_id
  has_many :business_cards, foreign_key: :district_id, primary_key: :dist_id

  validates :dist_id, presence: true, uniqueness: true
  validates :dist_name, presence: true
  validates :state_id, presence: true

  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "dist_area", "dist_block", "dist_cd", "dist_density", "dist_detail", "dist_hq", "dist_id", "dist_lang1", "dist_lang2", "dist_lati", "dist_logi", "dist_map", "dist_name", "dist_p_status", "dist_pop11", "dist_reach_img", "dist_sdist", "dist_seo_data", "dist_seo_kword", "dist_seo_mtag", "dist_status", "dist_web", "estd_dd", "estd_mm", "estd_yy", "state_id", "updated_at"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["cities", "state"]
  end

  # Add any other necessary validations or methods here
end
