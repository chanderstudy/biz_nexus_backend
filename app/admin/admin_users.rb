ActiveAdmin.register AdminUser do
  permit_params :email, :password, :password_confirmation, :role_id, :name, :mobile, :sex, 
                :blood_group, :aadhar_card, :pan_card, :gst_number, :address, :landmark, 
                :qualification, :pincode, :dob, :dom, :added_by, :managed_by, 
                :portal_id, :continent_id, :country_id, :state_id, :dist_id, 
                :city_id, :area_id

  filter :email
  # filter :name
  # filter :mobile
  # filter :role
  # filter :added_by, as: :select, collection: -> { AdminUser.pluck(:email, :id) } # Filter for added_by
  # filter :managed_by, as: :select, collection: -> { AdminUser.pluck(:email, :id) } # Filter for managed_by

  form do |f|
    f.inputs 'Admin User Details' do
      f.input :email
      f.input :password
      f.input :password_confirmation
      f.input :role, as: :select, collection: Role.all
      f.input :name
      f.input :mobile
      f.input :sex, as: :select, collection: [['Male', 'M'], ['Female', 'F'], ['Transgender', 'T']]
      f.input :blood_group, as: :select, collection: ['A+', 'A-', 'B+', 'B-', 'AB+', 'AB-', 'O+', 'O-']
      f.input :aadhar_card
      f.input :pan_card
      f.input :gst_number
      f.input :address
      f.input :landmark
      f.input :qualification
      f.input :pincode
      f.input :dob, as: :datepicker
      f.input :dom, as: :datepicker
      f.input :added_by, as: :select, collection: AdminUser.pluck(:email, :id), label: 'Added By' # Updated input for added_by
      f.input :managed_by, as: :select, collection: AdminUser.pluck(:email, :id), label: 'Managed By' # Updated input for managed_by
      f.input :portal_id, as: :select, collection: Portal.pluck(:portal_name, :id)
      f.input :continent_id, as: :select, collection: Continent.pluck(:name, :id)
      f.input :country_id, as: :select, collection: Country.pluck(:name, :id)
      f.input :state_id, as: :select, collection: State.pluck(:state_name, :state_id)
      f.input :dist_id, as: :select, collection: District.pluck(:dist_name, :dist_id)
      f.input :city_id, as: :select, collection: City.pluck(:city_name, :city_id)
      f.input :area_id, as: :select, collection: Area.pluck(:area_name, :area_id)
    end
    f.actions
  end

  index do
    selectable_column
    id_column
    column :email
    column :role
    column :name
    column :mobile
    column :sex
    column :blood_group
    column :aadhar_card
    column :pan_card
    column :gst_number
    column :address
    column :pincode
    column :dob
    column :added_by # Show added_by in index
    column :managed_by # Show managed_by in index
    column :created_at
    actions
  end

  show do
    attributes_table do
      row :email
      row :role
      row :name
      row :mobile
      row :sex
      row :blood_group
      row :aadhar_card
      row :pan_card
      row :gst_number
      row :address
      row :landmark
      row :qualification
      row :pincode
      row :dob
      row :dom
      row :added_by_admin # Show added_by information
      row :managed_by_admin # Show managed_by information
      row :portal
      row :continent
      row :country
      row :state
      row :district
      row :city
      row :area
      row :created_at
      row :updated_at
    end
    active_admin_comments
  end
end
