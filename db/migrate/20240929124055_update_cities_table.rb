class UpdateCitiesTable < ActiveRecord::Migration[7.2]
  def change
    remove_column :cities, :city_seo_kword, :string
    remove_column :cities, :city_seo_mtag, :string
    remove_column :cities, :city_seo_data, :text
    remove_column :cities, :city_p_status, :string
    remove_column :cities, :city_status, :string
    
    add_column :cities, :video_url, :string
    add_column :cities, :city_slug, :string
    add_column :cities, :publish, :boolean, default: true
  end
end