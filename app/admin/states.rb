# app/admin/state.rb
ActiveAdmin.register State do
  menu parent: "Geographical Units"
  permit_params :state_id, :state_code, :state_name, :state_hq, :state_detail, :state_pop11,
                :state_area, :state_density, :state_web, :state_lang1, :state_lang2, :state_logi,
                :state_lati, :state_reach_img, :state_map, :estd_dd, :estd_mm, :estd_yy,
                :state_seo_kword, :state_seo_mtag, :state_seo_data, :state_block, :state_sdist,
                :state_p_status, :state_status
  filter :state_name
  filter :city
  filter :district
  filter :area

  index do
    selectable_column
    id_column
    column :state_id
    column :state_code
    column :state_name
    column :state_hq
    column :state_detail
    column :state_pop11
    column :state_area
    column :state_density
    column :state_web
    column :state_lang1
    column :state_lang2
    column :state_logi
    column :state_lati
    column :state_reach_img
    column :state_map
    column :estd_dd
    column :estd_mm
    column :estd_yy
    column :state_seo_kword
    column :state_seo_mtag
    column :state_seo_data
    column :state_block
    column :state_sdist
    column :state_p_status
    column :state_status
    actions
  end

  form do |f|
    f.inputs do
      f.input :state_id
      f.input :state_code
      f.input :state_name
      f.input :state_hq
      f.input :state_detail
      f.input :state_pop11
      f.input :state_area
      f.input :state_density
      f.input :state_web
      f.input :state_lang1
      f.input :state_lang2
      f.input :state_logi
      f.input :state_lati
      f.input :state_reach_img
      f.input :state_map
      f.input :estd_dd
      f.input :estd_mm
      f.input :estd_yy
      f.input :state_seo_kword
      f.input :state_seo_mtag
      f.input :state_seo_data
      f.input :state_block
      f.input :state_sdist
      f.input :state_p_status
      f.input :state_status
    end
    f.actions
  end
end
