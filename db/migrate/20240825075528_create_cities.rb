class CreateCities < ActiveRecord::Migration[6.1]
  def change
    create_table :cities, id: false do |t|
      t.primary_key :city_id # Set city_id as the primary key
      t.integer :dist_id, null: false # Foreign key reference to districts table
      t.integer :state_id, null: false # Foreign key reference to states table
      t.string :city_name
      t.text :city_detail
      t.string :city_lang1
      t.string :city_lang2
      t.string :city_logi
      t.float :city_lati
      t.string :city_reach_img
      t.string :city_map
      t.string :city_seo_kword
      t.string :city_seo_mtag
      t.text :city_seo_data
      t.integer :city_pop11
      t.float :city_area
      t.float :city_density
      t.integer :city_star
      t.string :city_type
      t.string :city_tier
      t.string :city_smart
      t.string :crime_level
      t.integer :sdist_id
      t.string :city_p_status
      t.string :city_status

      t.timestamps
    end

    add_index :cities, :city_id, unique: true
    add_index :cities, :dist_id
    add_index :cities, :state_id

    # Add foreign key constraints
    add_foreign_key :cities, :districts, column: :dist_id, primary_key: :dist_id
    add_foreign_key :cities, :states, column: :state_id, primary_key: :state_id
  end
end
