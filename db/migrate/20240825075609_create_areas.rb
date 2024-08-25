# db/migrate/xxxxxx_create_areas.rb
class CreateAreas < ActiveRecord::Migration[6.1]
  def change
    create_table :areas, id: false do |t|
      t.primary_key :area_id # Set area_id as the primary key
      t.integer :city_id, null: false # Foreign key reference to cities table
      t.integer :dist_id, null: false # Foreign key reference to districts table
      t.integer :state_id, null: false # Foreign key reference to states table
      t.string :area_name
      t.text :area_detail
      t.string :area_reach_img
      t.string :area_map
      t.integer :area_star
      t.string :crime_level
      t.string :area_status
      t.string :area_logi
      t.float :area_lati
      t.string :area_type
      t.string :area_pin
      t.string :area_seo_kword
      t.string :area_seo_mtag
      t.text :area_seo_data
      t.string :area_p_status

      t.timestamps
    end

    add_index :areas, :area_id, unique: true
    add_index :areas, :city_id
    add_index :areas, :dist_id
    add_index :areas, :state_id

    # Add foreign key constraints
    add_foreign_key :areas, :cities, column: :city_id, primary_key: :city_id
    add_foreign_key :areas, :districts, column: :dist_id, primary_key: :dist_id
    add_foreign_key :areas, :states, column: :state_id, primary_key: :state_id
  end
end
