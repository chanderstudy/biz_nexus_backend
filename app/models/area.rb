# app/models/area.rb
class Area < ApplicationRecord
  belongs_to :city
  belongs_to :district, foreign_key: :dist_id
  has_many :business_cards, foreign_key: :area_id, primary_key: :area_id
  belongs_to :state

  validates :area_id, presence: true, uniqueness: true
  validates :area_name, presence: true
  validates :city_id, presence: true
  validates :dist_id, presence: true
  validates :state_id, presence: true

  def self.ransackable_associations(auth_object = nil)
    ["city", "district", "state"]
  end

  def self.ransackable_attributes(auth_object = nil)
    ["area_detail", "area_id", "area_lati", "area_logi", "area_map", "area_name", "area_p_status", "area_pin", "area_reach_img", "area_seo_data", "area_seo_kword", "area_seo_mtag", "area_star", "area_status", "area_type", "city_id", "created_at", "crime_level", "dist_id", "state_id", "updated_at"]
  end
end
