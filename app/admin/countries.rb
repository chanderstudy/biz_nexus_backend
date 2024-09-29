ActiveAdmin.register Country do
  menu parent: "Geographical Units"
  config.filters = false
  permit_params :continent_id, :sub_continent, :sovereignty, :economy_type, :name, :country_detail, :iso3, :iso2, 
                :population, :area_land, :area_density, :numeric_code, :phone_code, :capital, 
                :currency_name, :currency_code, :currency_symbol, :tld, :timezones, 
                :latitude, :longitude, :nationality, :photo, :official_map, :estd_date, 
                :official_web_url, :official_lang1, :official_lang2, :slug, :publish

  index do
    selectable_column
    id_column
    column :name
    column :sub_continent
    column :sovereignty
    column :economy_type
    column :population
    column :area_land
    column :capital
    column :publish
    actions
  end

  # filter :name
  # filter :sub_continent
  # filter :sovereignty
  # filter :economy_type
  # filter :publish

  form do |f|
    f.inputs do
      f.input :continent
      f.input :sub_continent
      f.input :sovereignty
      f.input :economy_type
      f.input :name
      f.input :country_detail
      f.input :iso3
      f.input :iso2
      f.input :population
      f.input :area_land
      f.input :area_density
      f.input :numeric_code
      f.input :phone_code
      f.input :capital
      f.input :currency_name
      f.input :currency_code
      f.input :currency_symbol
      f.input :tld
      f.input :timezones
      f.input :latitude
      f.input :longitude
      f.input :nationality
      f.input :photo
      f.input :official_map
      f.input :estd_date
      f.input :official_web_url
      f.input :official_lang1
      f.input :official_lang2
      f.input :slug
      f.input :publish
    end
    f.actions
  end
end
