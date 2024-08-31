class SocialMediaPorfile < ActiveRecord::Migration[7.2]
  def change
    create_table :social_media_profiles do |t|
      t.string :facebook, limit: 15
      t.string :youtube, limit: 15
      t.string :instagram, limit: 15
      t.string :linkedin, limit: 15
      t.string :other, limit: 15
      t.timestamps
    end
  end
end
