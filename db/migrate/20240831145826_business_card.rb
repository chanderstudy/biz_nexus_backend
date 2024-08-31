class BusinessCard < ActiveRecord::Migration[7.2]
  def change
    create_table :business_cards do |t|
      t.string :name, limit: 128, null: false                # Business name
      t.string :owner_name, limit: 128                       # Owner's name
      t.string :email, limit: 64                             # Business email
      t.string :address, limit: 128                          # Business address
      t.string :landmark, limit: 128                         # Landmark (optional)
      t.string :mobile, limit: 32                            # Mobile number
      t.string :latitude                         # Latitude for geolocation
      t.string :longitude                       # Longitude for geolocation
      t.integer :bcard_type              # Bcard Type Paid/Free
      t.integer :bcard_power                     # Priority to list card
      t.references :business_category, foreign_key: true     # Reference to BusinessCategory
      t.references :business_sub_category, foreign_key: true # Reference to BusinessSubCategory
      t.integer :pstatus                       # Bcard current status
      t.integer :status                         # Bcard publish status
      t.boolean :seo_active, default: false                  # SEO Activation
      t.references :business_seo_profile, foreign_key: true  # Reference to BusinessSeoProfile
      t.references :social_media_profile, foreign_key: true  # Reference to SocialMediaProfile
      t.string :website, limit: 94                           # Website link
      t.string :bank_account, limit: 15                      # Bank account number
      t.string :bank_ifsc                       # Bank IFSC code
      t.integer :bank_type                 # Bank type (1 or 2)
      t.boolean :qrcode_active, default: false               # QR code payment option
      t.string :qrcode_file, limit: 128                      # QR code file path

      t.timestamps
    end
  end
end
