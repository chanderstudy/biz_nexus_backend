class UpdateForeignKeysForProfiles < ActiveRecord::Migration[7.2]
  def change
    # Remove foreign keys from business_cards
    remove_foreign_key :business_cards, :business_seo_profiles
    remove_foreign_key :business_cards, :social_media_profiles

    # Remove columns from business_cards
    remove_column :business_cards, :business_seo_profile_id, :bigint
    remove_column :business_cards, :social_media_profile_id, :bigint

    # Add foreign key to business_seo_profiles
    change_table :business_seo_profiles do |t|
      t.references :business_card, foreign_key: true, index: true
    end

    # Add foreign key to social_media_profiles
    change_table :social_media_profiles do |t|
      t.references :business_card, foreign_key: true, index: true
    end
  end
end
