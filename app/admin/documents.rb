ActiveAdmin.register Document do
  permit_params :title, :document_type, :status, :file, :documentable_type, :documentable_id
  config.filters = false

  form do |f|
    f.inputs "Document Details" do
      f.input :title
      f.input :document_type
      f.input :status
      f.input :file, as: :file
      f.input :documentable_type, as: :select, collection: ['BusinessCard', 'Product'] # Customize based on your models
      f.input :documentable_id
    end
    f.actions
  end
end
