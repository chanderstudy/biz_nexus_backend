# app/admin/business_categories.rb
ActiveAdmin.register BusinessCategory do
  menu parent: "Manage Business Card"
  permit_params :name

  # Customize the index page
  index do
    selectable_column
    id_column
    column :name
    actions
  end

  # Customize the form for creating/editing records
  form do |f|
    f.inputs 'Business Category Details' do
      f.input :name
    end
    f.actions
  end

  # Add filters if necessary
  filter :name
end
