ActiveAdmin.register Transaction do
  permit_params :payment_mode, :payment_id, :amount, :status, :remarks
  config.filters = false

  index do
    selectable_column
    id_column
    column :payment_mode
    column :payment_id
    column :amount
    column :status
    column :remarks
    actions
  end

  form do |f|
    f.inputs 'Transaction Details' do
      f.input :payment_mode
      f.input :payment_id
      f.input :amount
      f.input :status
      f.input :remarks
    end
    f.actions
  end

  show do
    attributes_table do
      row :payment_mode
      row :payment_id
      row :amount
      row :status
      row :remarks
      row :created_at
      row :updated_at
    end
    active_admin_comments
  end
end
