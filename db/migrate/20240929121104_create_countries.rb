class CreateCountries < ActiveRecord::Migration[7.2]
  def change
    create_table :countries do |t|
      t.integer :continent_id
      t.string :sub_continent
      t.string :sovereignty
      t.string :economy_type
      t.string :name
      t.text :country_detail
      t.string :iso3
      t.string :iso2
      t.string :population
      t.string :area_land
      t.string :area_density
      t.integer :numeric_code
      t.integer :phone_code
      t.string :capital
      t.string :currency_name
      t.string :currency_code
      t.string :currency_symbol
      t.string :tld
      t.string :timezones
      t.string :latitude
      t.string :longitude
      t.string :nationality
      t.string :photo
      t.string :official_map
      t.string :estd_date
      t.string :official_web_url
      t.integer :official_lang1
      t.integer :official_lang2
      t.string :slug
      t.integer :publish

      t.timestamps
    end
  end
end
