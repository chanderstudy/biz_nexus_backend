ActiveAdmin.register Continent do
  menu parent: "Geographical Units"
  permit_params :name, :detail, :population, :area_land, :area_density, :population_share, :photo, :video_url, :map, :slug, :publish
  config.filters = false

  index do
    selectable_column
    id_column
    column :name
    column :detail
    column :population
    column :area_land
    column :area_density
    column :population_share
    column :publish
    actions
  end

  form do |f|
    f.inputs do
      f.input :name
      f.input :detail
      f.input :population
      f.input :area_land
      f.input :area_density
      f.input :population_share
      f.input :photo
      f.input :video_url
      f.input :map
      f.input :slug
      f.input :publish
    end
    f.actions
  end
end
