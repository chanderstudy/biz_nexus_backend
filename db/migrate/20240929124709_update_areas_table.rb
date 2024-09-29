class UpdateAreasTable < ActiveRecord::Migration[7.2]
  def change
    # Remove columns
    remove_column :areas, :area_seo_kword, :string
    remove_column :areas, :area_seo_mtag, :string
    remove_column :areas, :area_seo_data, :text
    remove_column :areas, :area_p_status, :string
    remove_column :areas, :area_status, :string

    # Add new columns
    add_column :areas, :area_slug, :string
    add_column :areas, :area_post_office, :string
    add_column :areas, :video_url, :string
    add_column :areas, :publish, :boolean, default: true  # Assuming publish is a boolean
  end
end
