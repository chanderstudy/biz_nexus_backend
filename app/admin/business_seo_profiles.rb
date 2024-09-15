# app/admin/business_seo_profiles.rb
ActiveAdmin.register BusinessSeoProfile do
  menu parent: "Manage Business Card"
  permit_params :active, :keywords, :meta_tag, :description, images: []

  # Customize the index page
  index do
    selectable_column
    id_column
    column :active
    column :keywords
    column :meta_tag
    column :description
    actions
  end

  # Customize the form for creating/editing records
  form do |f|
    f.inputs 'Business SEO Profile Details' do
      f.input :active
      f.input :keywords
      f.input :meta_tag
      f.input :description
      f.input :images, as: :file, input_html: { multiple: true }
    end
    f.actions
  end

  show do
    attributes_table do
      row :active
      row :keywords
      row :meta_tag
      row :description
      row :created_at
      row :updated_at
    end

    panel 'Images' do
      div do
        business_seo_profile.images.each do |image|
        	div do
          	image_tag rails_blob_path(image), style: 'max-height:300px'
          end
        end
      end
    end
  end

  # Add filters if necessary
  filter :active
  filter :keywords
  filter :meta_tag
  filter :description
end
