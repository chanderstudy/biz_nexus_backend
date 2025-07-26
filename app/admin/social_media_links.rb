ActiveAdmin.register SocialMediaLink do
  permit_params :priority, :title, :url, :status, :linkable_type, :social_media_type, :linkable_id
  config.filters = false
  menu parent: "Manage Business Card"

  index do
    selectable_column
    id_column
    column :linkable_type
    column :linkable_id
    column :social_media_type
    column :priority
    column :title
    column :url
    column :status
    actions
  end

  form do |f|
    f.inputs 'Business Card Link Details' do
      f.input :linkable_type, as: :select, collection: ['BusinessCard']
      f.input :linkable_id
      f.input :social_media_type, as: :select, collection: SocialMediaLink.social_media_types.keys
      f.input :priority
      f.input :title
      f.input :url
      f.input :status
    end
    f.actions
  end

  show do
    attributes_table do
      row :linkable_type
      row :linkable_id
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
