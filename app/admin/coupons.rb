ActiveAdmin.register Coupon do
  permit_params :type, :created_for, :name, :code, :percentage, :fix_discount, :max_discount, :start_date, :end_date, :description, :logo, :priority, :status
  config.filters = false
  index do
    selectable_column
    id_column
    column :type
    column :created_for
    column :name
    column :code
    column :percentage
    column :fix_discount
    column :max_discount
    column :start_date
    column :end_date
    column :priority
    column :status
    actions
  end

  form do |f|
    f.inputs 'Coupon Details' do
      f.input :type
      f.input :created_for
      f.input :name
      f.input :code
      f.input :percentage
      f.input :fix_discount
      f.input :max_discount
      f.input :start_date
      f.input :end_date
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
      row :type
      row :created_for
      row :name
      row :code
      row :percentage
      row :fix_discount
      row :max_discount
      row :start_date
      row :end_date
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
