class CreateDistricts < ActiveRecord::Migration[6.1]
  def change
    create_table :districts, id: false do |t|
      t.primary_key :dist_id # Set dist_id as the primary key
      t.integer :state_id, null: false # Foreign key reference to states table
      t.string :dist_cd
      t.string :dist_name
      t.string :dist_hq
      t.text :dist_detail
      t.integer :dist_pop11
      t.float :dist_area
      t.float :dist_density
      t.string :dist_web
      t.string :dist_lang1
      t.string :dist_lang2
      t.string :dist_logi
      t.float :dist_lati
      t.string :dist_reach_img
      t.string :dist_map
      t.integer :estd_dd
      t.integer :estd_mm
      t.integer :estd_yy
      t.string :dist_seo_kword
      t.string :dist_seo_mtag
      t.text :dist_seo_data
      t.string :dist_block
      t.string :dist_sdist
      t.string :dist_p_status
      t.string :dist_status

      t.timestamps
    end

    add_index :districts, :dist_id, unique: true
    add_index :districts, :state_id

    # Add foreign key constraint
    add_foreign_key :districts, :states, column: :state_id, primary_key: :state_id
  end
end
