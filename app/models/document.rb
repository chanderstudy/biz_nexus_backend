class Document < ApplicationRecord
  belongs_to :documentable, polymorphic: true
  has_one_attached :file

  # Validations (optional)
  validates :title, presence: true
  validates :document_type, presence: true
  validates :status, presence: true

  def file_url
    Rails.application.routes.url_helpers.rails_blob_url(file) if file.attached?
  end
end
