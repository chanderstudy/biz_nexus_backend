ActiveAdmin.register Subscription do
  # Permit the parameters
  permit_params :name, :price, :discount, :duration, :description, :logo, :banner, :priority, :status
  config.filters = false
  index do
    selectable_column
    id_column
    column :name
    column :price
    column :duration
    column :priority
    column :status
    actions
  end


  form do |f|
    f.inputs 'Subscription Details' do
      f.input :name
      f.input :price
      f.input :duration
      f.input :description
      f.input :logo, as: :file
      f.input :banner, as: :file
      f.input :priority
      f.input :status
    end
    f.actions
  end

  show do
    attributes_table do
      row :name
      row :price
      row :duration
      row :description
      row :logo
      row :banner
      row :priority
      row :status
      row :created_at
      row :updated_at
    end
    active_admin_comments
  end
end
