class AdminUser < ApplicationRecord
  belongs_to :role, optional: true
  belongs_to :added_by_admin, class_name: 'AdminUser', foreign_key: :added_by, optional: true
  belongs_to :managed_by_admin, class_name: 'AdminUser', foreign_key: :managed_by, optional: true
  belongs_to :portal, optional: true
  belongs_to :continent, optional: true
  belongs_to :country, optional: true
  belongs_to :state, foreign_key: :state_id, primary_key: :state_id, optional: true
  belongs_to :district, foreign_key: :dist_id, primary_key: :dist_id, optional: true
  belongs_to :city, foreign_key: :city_id, primary_key: :city_id, optional: true
  belongs_to :area, foreign_key: :area_id, primary_key: :area_id, optional: true
  devise :database_authenticatable, 
         :recoverable, :rememberable, :validatable
  belongs_to :role
  has_many :added_admins, class_name: 'AdminUser', foreign_key: :added_by
  has_many :orders

  validates :email, presence: true, uniqueness: true
  validates :encrypted_password, presence: true
  validates :name, presence: true
  validates :mobile, presence: true, uniqueness: true
  validates :aadhar_card, length: { is: 12 }, allow_blank: true
  validates :pan_card, length: { is: 10 }, allow_blank: true
  validates :gst_number, length: { is: 15 }, allow_blank: true

  def role?(role_name)
    role.name == role_name
  end

  def self.ransackable_associations(auth_object = nil)
    ["role"]
  end

  def self.ransackable_attributes(auth_object = nil)
    %w[id email created_at updated_at reset_password_token]
  end
end
