class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, 
         :recoverable, :rememberable, :validatable

  has_many :placed_orders, class_name: 'Order', foreign_key: 'placed_by', dependent: :destroy
  has_many :orders_as_agent, class_name: 'Order', foreign_key: 'agent_id', dependent: :destroy
  has_many :orders, dependent: :destroy # Assuming the user can also be the one who places the order

  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "email", "id", "updated_at"]
  end
end
