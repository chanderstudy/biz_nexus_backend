ActiveAdmin.register AdminUser do
  permit_params :email, :password, :password_confirmation, :role_id
  config.filters = false

  form do |f|
    f.inputs 'Admin User Details' do
      f.input :email
      f.input :password
      f.input :password_confirmation
      f.input :role, as: :select, collection: Role.all
    end
    f.actions
  end

  index do
    selectable_column
    id_column
    column :email
    column :role
    column :created_at
    actions
  end

  show do
    attributes_table do
      row :email
      row :role
      row :created_at
      row :updated_at
    end
  end
end
