class DropSocialMediaProfilesTable < ActiveRecord::Migration[7.2]
  def change
    drop_table :social_media_profiles
    rename_table :business_card_links, :social_media_links
    add_column :social_media_links, :linkable_type, :string
    add_column :social_media_links, :linkable_id, :bigint
    add_index :social_media_links, [:linkable_type, :linkable_id]
    remove_column :social_media_links, :business_card_id
  end
end
