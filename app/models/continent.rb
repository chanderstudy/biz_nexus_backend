class Continent < ApplicationRecord
  validates :name, presence: true, length: { maximum: 64 }
end
