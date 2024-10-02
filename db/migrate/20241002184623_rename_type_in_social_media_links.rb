class RenameTypeInSocialMediaLinks < ActiveRecord::Migration[7.2]
  def change
    rename_column :social_media_links, :type, :social_media_type
  end
end
