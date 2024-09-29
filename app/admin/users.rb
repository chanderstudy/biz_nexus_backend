ActiveAdmin.register User do
  permit_params :email, :password, :password_confirmation, :name, :mobile, :sex, 
                :blood_group, :address, :landmark, :qualification, :dob, :dom, 
                :status, :portal_id, :continent_id, :country_id, :state_id, 
                :dist_id, :city_id, :area_id

  index do
    selectable_column
    id_column
    column :email
    column :name
    column :mobile
    column :sex
    column :blood_group
    column :address
    column :dob
    column :dom
    column :status
    column :current_sign_in_at
    column :sign_in_count
    column :created_at
    column :updated_at
    actions
  end

  filter :email
  # filter :name
  # filter :mobile
  # filter :status
  # filter :created_at

  form do |f|
    f.inputs 'User Details' do
      f.input :email
      f.input :password
      f.input :password_confirmation
      f.input :name
      f.input :mobile
      f.input :sex, as: :select, collection: ['Male', 'Female', 'Transgender']
      f.input :blood_group, as: :select, collection: ['A+', 'A-', 'B+', 'B-', 'O+', 'O-', 'AB+', 'AB-']
      f.input :address
      f.input :landmark
      f.input :qualification
      f.input :dob, as: :datepicker
      f.input :dom, as: :datepicker
      f.input :status
      f.input :portal_id, as: :select, collection: Portal.pluck(:name, :id)
      f.input :continent_id, as: :select, collection: Continent.pluck(:name, :id)
      f.input :country_id, as: :select, collection: Country.pluck(:name, :id)
      f.input :state_id, as: :select, collection: State.pluck(:state_name, :state_id)
      f.input :dist_id, as: :select, collection: District.pluck(:dist_name, :dist_id)
      f.input :city_id, as: :select, collection: City.pluck(:city_name, :city_id)
      f.input :area_id
    end
    f.actions
  end

  show do
    attributes_table do
      row :email
      row :name
      row :mobile
      row :sex
      row :blood_group
      row :address
      row :landmark
      row :qualification
      row :dob
      row :dom
      row :status
      row :portal
      row :continent
      row :country
      row :state
      row :district
      row :city
      row :area_id
      row :current_sign_in_at
      row :sign_in_count
      row :created_at
      row :updated_at
    end
  end
end
