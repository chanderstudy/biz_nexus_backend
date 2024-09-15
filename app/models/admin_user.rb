class AdminUser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  has_many :orders

  # filters :null
  devise :database_authenticatable, 
         :recoverable, :rememberable, :validatable
  belongs_to :role

  def role?(role_name)
    role.name == role_name
  end

  def self.ransackable_associations(auth_object = nil)
    ["role"]
  end

  def self.ransackable_attributes(auth_object = nil)
    %w[id email created_at updated_at reset_password_token] # Add reset_password_token to the list
  end
  # You can also define which associations can be searched
  # def self.ransackable_associations(auth_object = nil)
  #   %w[roles]
  # end

end
