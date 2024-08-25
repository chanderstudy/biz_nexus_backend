class CreateStates < ActiveRecord::Migration[7.2]
  def change
    create_table :states, id: false do |t|
      t.primary_key :state_id # Use state_id as the primary key

      t.string :state_type
      t.string :state_name
      t.string :state_hq
      t.string :state_cd
      t.text :state_detail
      t.string :state_logi
      t.float :state_lati
      t.float :state_reach_img
      t.string :state_map
      t.integer :estd_dd
      t.integer :estd_mm
      t.integer :estd_yy
      t.string :state_web
      t.string :state_lang1
      t.string :state_lang2
      t.string :state_seo_kword
      t.string :state_seo_mtag
      t.text :state_seo_data
      t.string :state_p_status
      t.string :state_status
      t.string :state_dist

      t.timestamps
    end
  end
end
