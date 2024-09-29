# app/admin/district.rb
ActiveAdmin.register District do
  menu parent: "Geographical Units"
  permit_params :dist_id, :state_id, :dist_cd, :dist_name, :dist_hq, :dist_detail, :dist_pop11,
                :dist_area, :dist_density, :dist_web, :dist_lang1, :dist_lang2, :dist_logi,
                :dist_lati, :dist_reach_img, :dist_map, :video_url, :web_url, :established_date,
                :dist_block, :dist_sdist, :dist_p_status, :dist_status
  
  filter :dist_name
  filter :state
  # You might want to add city and area filters if applicable
  # filter :city
  # filter :area

  index do
    selectable_column
    id_column
    column :dist_id
    column :state_id
    column :dist_cd
    column :dist_name
    column :dist_hq
    column :dist_detail
    column :dist_pop11
    column :dist_area
    column :dist_density
    column :dist_web
    column :dist_lang1
    column :dist_lang2
    column :dist_logi
    column :dist_lati
    column :dist_reach_img
    column :dist_map
    column :video_url
    column :web_url
    column :established_date
    column :dist_block
    column :dist_sdist
    column :dist_p_status
    column :dist_status
    actions
  end

  form do |f|
    f.inputs do
      f.input :dist_id
      f.input :state_id, as: :select, collection: State.all.map { |s| [s.state_name, s.state_id] }
      f.input :dist_cd
      f.input :dist_name
      f.input :dist_hq
      f.input :dist_detail
      f.input :dist_pop11
      f.input :dist_area
      f.input :dist_density
      f.input :dist_web
      f.input :dist_lang1
      f.input :dist_lang2
      f.input :dist_logi
      f.input :dist_lati
      f.input :dist_reach_img
      f.input :dist_map
      f.input :video_url
      f.input :web_url
      f.input :established_date, as: :datetime_picker  # Adjust as needed based on your setup
      f.input :dist_block
      f.input :dist_sdist
      f.input :dist_p_status
      f.input :dist_status
    end
    f.actions
  end
end
