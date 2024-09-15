class Faq < ApplicationRecord
  belongs_to :faqable, polymorphic: true

  def self.ransackable_associations(auth_object = nil)
    ["faqable"]
  end

  def self.ransackable_attributes(auth_object = nil)
    ["answer", "created_at", "faqable_id", "faqable_type", "id", "question", "updated_at"]
  end
end
