class UpdateBusinessCards < ActiveRecord::Migration[7.2]
  def change
    # Remove specified columns
    remove_column :business_cards, :qrcode_active, :boolean, default: false
    remove_column :business_cards, :qrcode_file, :string, limit: 128
    remove_column :business_cards, :status, :integer

    # Add new columns
    add_column :business_cards, :achivement_publish, :boolean
    add_column :business_cards, :certificate_publish, :boolean
    add_column :business_cards, :short_url_publish, :boolean

    # Add foreign key references for new models
    add_reference :business_cards, :country, foreign_key: true
    add_reference :business_cards, :continent, foreign_key: true
    add_reference :business_cards, :owned_by, foreign_key: { to_table: :users }  # Assuming User model
  end
end
