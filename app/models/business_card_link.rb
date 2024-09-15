class BusinessCardLink < ApplicationRecord
  belongs_to :business_card

  enum type: %i[facebook youtube instagram justdial linkedin other]
  enum status: %i[deactivate active]
end
