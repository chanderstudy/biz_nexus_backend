class Country < ApplicationRecord
  validates :continent_id, presence: true
  belongs_to :continent

  # Additional methods or scopes can be added here
end
