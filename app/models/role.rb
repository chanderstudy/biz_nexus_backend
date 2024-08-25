class Role < ApplicationRecord
	has_many :admin_users

	def self.ransackable_attributes(auth_object = nil)
    ["created_at", "id", "id_value", "name", "updated_at"]
  end
end
