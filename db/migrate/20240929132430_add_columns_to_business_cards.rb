class AddColumnsToBusinessCards < ActiveRecord::Migration[6.0]
  def change
    add_column :business_cards, :description, :string
    add_column :business_cards, :owner_designation, :string
    add_column :business_cards, :work_phone_number, :string
    add_column :business_cards, :established_date, :date
    add_column :business_cards, :created_by, :bigint
    add_column :business_cards, :managed_by, :bigint
    add_column :business_cards, :short_url, :string
    add_column :business_cards, :published, :boolean, default: false
    add_column :business_cards, :promotion_type, :string
    add_column :business_cards, :plan_id, :bigint
    add_column :business_cards, :qr_publish, :boolean, default: false
    add_column :business_cards, :bank_name, :string
    add_column :business_cards, :legal_publish, :boolean, default: false
    add_column :business_cards, :business_pan_card, :string
    add_column :business_cards, :gst_number, :string
    add_column :business_cards, :service_publish, :boolean, default: false
    add_column :business_cards, :catalog_publish, :boolean, default: false
    add_column :business_cards, :social_media_publish, :boolean, default: false
    add_column :business_cards, :photo_gallery_publish, :boolean, default: false
    add_column :business_cards, :video_gallery_publish, :boolean, default: false
    add_column :business_cards, :feedback_publish, :boolean, default: false
    add_column :business_cards, :enquiry_publish, :boolean, default: false
    add_column :business_cards, :external_portal_publish, :boolean, default: false
    add_column :business_cards, :achivement, :text

    # Foreign key constraints
    add_foreign_key :business_cards, :admin_users, column: :created_by
    add_foreign_key :business_cards, :admin_users, column: :managed_by
    add_foreign_key :business_cards, :plans, column: :plan_id
  end
end
