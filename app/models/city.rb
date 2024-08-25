# app/models/city.rb
class City < ApplicationRecord
  belongs_to :district, foreign_key: :dist_id
  belongs_to :state
  has_many :areas

  validates :city_id, presence: true, uniqueness: true
  validates :city_name, presence: true
  validates :dist_id, presence: true
  validates :state_id, presence: true

  # Add any other necessary validations or methods here

  def self.ransackable_attributes(auth_object = nil)
    ["city_area", "city_density", "city_detail", "city_id", "city_lang1", "city_lang2", "city_lati", "city_logi", "city_map", "city_name", "city_p_status", "city_pop11", "city_reach_img", "city_seo_data", "city_seo_kword", "city_seo_mtag", "city_smart", "city_star", "city_status", "city_tier", "city_type", "created_at", "crime_level", "dist_id", "sdist_id", "state_id", "updated_at"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["areas", "district", "state"]
  end

end
