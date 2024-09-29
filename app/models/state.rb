# app/models/state.rb
class State < ApplicationRecord
  belongs_to :country
  has_many :districts
  has_many :cities, through: :districts
  has_many :areas, through: :cities
  has_many :business_cards, foreign_key: :state_id, primary_key: :state_id

  validates :state_id, presence: true, uniqueness: true
  validates :state_name, presence: true

  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "estd_dd", "estd_mm", "estd_yy", "state_cd", "state_detail", "state_dist", "state_hq", "state_id", "state_lang1", "state_lang2", "state_lati", "state_logi", "state_map", "state_name", "state_p_status", "state_reach_img", "state_seo_data", "state_seo_kword", "state_seo_mtag", "state_status", "state_type", "state_web", "updated_at"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["areas", "cities", "districts"]
  end

  # Add any other necessary validations or methods here
end
