class QuoteRequest < ApplicationRecord
  belongs_to :quotable, polymorphic: true

  enum status: { Pending: 0, Reviewed: 1, Archieved: 2 }

  validates :name, :email, presence: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }

  after_initialize :set_default_status, if: :new_record?

  def self.ransackable_associations(auth_object = nil)
    ["quotable"]
  end

  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "email", "id", "message", "name", "phone", "quotable_id", "quotable_type", "status", "updated_at"]
  end

  private

  def set_default_status
    self.status ||= :Pending
  end
end
