# app/admin/city.rb
ActiveAdmin.register City do
  menu parent: "Geographical Units"
  permit_params :city_id, :dist_id, :state_id, :city_name, :city_detail, :city_lang1, :city_lang2,
                :city_logi, :city_lati, :city_reach_img, :city_map, :city_seo_kword, :city_seo_mtag,
                :city_seo_data, :city_pop11, :city_area, :city_density, :city_star, :city_type,
                :city_tier, :city_smart, :crime_level, :sdist_id, :city_p_status, :city_status

  filter :city_name
  filter :state
  filter :district
  filter :area

  # Nested filter for business cards
  filter :business_cards_name, as: :string, label: 'Business Card Name'
  filter :business_cards_owner_name, as: :string, label: 'Business Card Owner'
  filter :business_cards_email, as: :string, label: 'Business Card Email'

  index do
    selectable_column
    id_column
    column :city_id
    column :dist_id
    column :state_id
    column :city_name
    column :city_detail
    column :city_lang1
    column :city_lang2
    column :city_logi
    column :city_lati
    column :city_reach_img
    column :city_map
    column :city_seo_kword
    column :city_seo_mtag
    column :city_seo_data
    column :city_pop11
    column :city_area
    column :city_density
    column :city_star
    column :city_type
    column :city_tier
    column :city_smart
    column :crime_level
    column :sdist_id
    column :city_p_status
    column :city_status
    actions
  end

  form do |f|
    f.inputs do
      f.input :city_id
      f.input :dist_id, as: :select, collection: District.all.map { |d| [d.dist_name, d.dist_id] }
      f.input :state_id, as: :select, collection: State.all.map { |s| [s.state_name, s.state_id] }
      f.input :city_name
      f.input :city_detail
      f.input :city_lang1
      f.input :city_lang2
      f.input :city_logi
      f.input :city_lati
      f.input :city_reach_img
      f.input :city_map
      f.input :city_seo_kword
      f.input :city_seo_mtag
      f.input :city_seo_data
      f.input :city_pop11
      f.input :city_area
      f.input :city_density
      f.input :city_star
      f.input :city_type
      f.input :city_tier
      f.input :city_smart
      f.input :crime_level
      f.input :sdist_id
      f.input :city_p_status
      f.input :city_status
    end
    f.actions
  end
end
