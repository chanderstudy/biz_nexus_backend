class ModifyDistricts < ActiveRecord::Migration[7.2]
  def change
    change_table :districts do |t|
      # Add new columns
      t.string :video_url
      t.string :web_url
      t.datetime :established_date

      # Remove old columns
      t.remove :estd_dd, :estd_mm, :estd_yy
      t.remove :dist_seo_kword, :dist_seo_mtag, :dist_seo_data
    end
  end
end
