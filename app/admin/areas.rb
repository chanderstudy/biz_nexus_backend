# app/admin/area.rb
ActiveAdmin.register Area do
  menu parent: "Geographical Units"
  permit_params :area_id, :city_id, :dist_id, :state_id, :area_name, :area_detail, :area_reach_img,
                :area_map, :area_star, :crime_level, :area_status, :area_logi, :area_lati,
                :area_type, :area_pin, :area_seo_kword, :area_seo_mtag, :area_seo_data, :area_p_status

  filter :area_name
  filter :state
  filter :city
  filter :district

  index do
    selectable_column
    id_column
    column :area_id
    column :city_id
    column :dist_id
    column :state_id
    column :area_name
    column :area_detail
    column :area_reach_img
    column :area_map
    column :area_star
    column :crime_level
    column :area_status
    column :area_logi
    column :area_lati
    column :area_type
    column :area_pin
    column :area_seo_kword
    column :area_seo_mtag
    column :area_seo_data
    column :area_p_status
    actions
  end

  form do |f|
    f.inputs do
      f.input :area_id
      f.input :city_id, as: :select, collection: City.all.map { |c| [c.city_name, c.city_id] }
      f.input :dist_id, as: :select, collection: District.all.map { |d| [d.dist_name, d.dist_id] }
      f.input :state_id, as: :select, collection: State.all.map { |s| [s.state_name, s.state_id] }
      f.input :area_name
      f.input :area_detail
      f.input :area_reach_img
      f.input :area_map
      f.input :area_star
      f.input :crime_level
      f.input :area_status
      f.input :area_logi
      f.input :area_lati
      f.input :area_type
      f.input :area_pin
      f.input :area_seo_kword
      f.input :area_seo_mtag
      f.input :area_seo_data
      f.input :area_p_status
    end
    f.actions
  end
end
