class AdminUser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

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
    %w[id email created_at updated_at] # Add any other attributes you want to be searchable
  end

  # You can also define which associations can be searched
  # def self.ransackable_associations(auth_object = nil)
  #   %w[roles]
  # end

end
