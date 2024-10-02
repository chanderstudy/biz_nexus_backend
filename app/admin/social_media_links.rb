ActiveAdmin.register SocialMediaLink do
  permit_params :social_media_type, :priority, :title, :url, :status
  config.filters = false
  menu parent: "Manage Business Card"

  index do
    selectable_column
    id_column
    column :social_media_type
    column :priority
    column :title
    column :url
    column :status
    actions
  end

  form do |f|
    f.inputs 'Business Card Link Details' do
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
      row :social_media_type
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
