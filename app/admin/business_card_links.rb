ActiveAdmin.register BusinessCardLink do
  permit_params :business_card_id, :type, :priority, :title, :url, :status
  config.filters = false
  menu parent: "Manage Business Card"

  index do
    selectable_column
    id_column
    column :business_card
    column :type
    column :priority
    column :title
    column :url
    column :status
    actions
  end

  form do |f|
    f.inputs 'Business Card Link Details' do
      f.input :business_card
      f.input :type
      f.input :priority
      f.input :title
      f.input :url
      f.input :status
    end
    f.actions
  end

  show do
    attributes_table do
      row :business_card
      row :type
      row :priority
      row :title
      row :url
      row :status
      row :created_at
      row :updated_at
    end
    active_admin_comments
  end
end
