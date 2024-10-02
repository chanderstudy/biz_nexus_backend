ActiveAdmin.register State do
  menu parent: "Geographical Units"
  
  # Allow parameters for mass assignment
  permit_params :state_id, :state_cd, :state_name, :state_hq, :state_detail, :state_pop11,
                :state_area, :state_density, :state_web, :state_lang1, :state_lang2, 
                :state_logi, :state_lati, :state_reach_img, :state_map,
                :state_slug, :population, :area_land, :area_density, :publish, :video_url

  # Filters for the index page
  filter :state_name
  filter :city
  filter :district
  filter :area


  collection_action :autocomplete, method: :get do
    states = State.ransack(state_name_cont: params[:q]).result(distinct: true)
    render json: { results: states.map { |state| { id: state.id, text: state.state_name } } }
  end

  index do
    selectable_column
    id_column
    column :state_id
    column :state_cd
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
    column :state_slug
    column :population
    column :area_land
    column :area_density
    column :publish
    column :video_url
    actions
  end

  form do |f|
    f.inputs do
      f.input :state_id
      f.input :state_cd
      f.input :state_name
      f.input :state_hq
      f.input :state_detail
      f.input :state_web
      f.input :state_lang1
      f.input :state_lang2
      f.input :state_logi
      f.input :state_lati
      f.input :state_reach_img
      f.input :state_map
      f.input :state_slug
      f.input :population
      f.input :area_land
      f.input :area_density
      f.input :publish
      f.input :video_url
    end
    f.actions
  end
end
