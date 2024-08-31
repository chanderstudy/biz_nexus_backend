# app/admin/business_seo_profiles.rb
ActiveAdmin.register BusinessSeoProfile do
  menu parent: "Manage Business Card"
  permit_params :active, :keywords, :meta_tag, :description

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
    end
    f.actions
  end

  # Add filters if necessary
  filter :active
  filter :keywords
  filter :meta_tag
  filter :description
end
