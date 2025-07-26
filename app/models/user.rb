class User < ApplicationRecord
  belongs_to :portal, optional: true
  belongs_to :continent, optional: true
  belongs_to :country, optional: true
  belongs_to :state, foreign_key: :state_id, primary_key: :state_id, optional: true
  belongs_to :district, foreign_key: :dist_id, primary_key: :dist_id, optional: true
  belongs_to :city, foreign_key: :city_id, primary_key: :city_id, optional: true
  belongs_to :area, foreign_key: :area_id, primary_key: :area_id, optional: true
  belongs_to :owned_by, class_name: 'User', foreign_key: 'owned_by_id', optional: true
  devise :database_authenticatable, 
         :recoverable, :rememberable, :validatable

  has_many :placed_orders, class_name: 'Order', foreign_key: 'placed_by', dependent: :destroy
  has_many :orders_as_agent, class_name: 'Order', foreign_key: 'agent_id', dependent: :destroy
  has_many :orders, dependent: :destroy # Assuming the user can also be the one who places the order

  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "email", "id", "updated_at"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["area", "city", "continent", "country", "district", "orders", "orders_as_agent", "placed_orders", "portal", "state"]
  end
end
