ActiveAdmin.register Subscription do
  permit_params :start_date, :end_date, :status  
  config.filters = false
  menu parent: "Subscription Plans"

  index do
    selectable_column
    id_column
    column :start_date
    column :end_date
    column :status
    actions
  end


  form do |f|
    f.inputs 'Plan Details' do
      f.input :start_date
      f.input :end_date
      f.input :status
    end
    f.actions
  end

  show do
    attributes_table do
      row :start_date
      row :end_date
      row :status
      row :created_at
      row :updated_at
    end
    active_admin_comments
  end
end
