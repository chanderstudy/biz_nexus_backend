class CreateContinents < ActiveRecord::Migration[7.2]
  def change
    create_table :continents do |t|
      t.string :name, limit: 64
      t.text :detail
      t.string :population, limit: 15
      t.string :area_land, limit: 15
      t.string :area_density, limit: 10
      t.string :population_share, limit: 4
      t.string :photo, limit: 64
      t.string :video_url, limit: 256
      t.string :map, limit: 64
      t.string :slug, limit: 128
      t.integer :publish, limit: 1

      t.timestamps
    end
  end
end
