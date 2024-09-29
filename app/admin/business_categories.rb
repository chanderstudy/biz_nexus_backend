ActiveAdmin.register BusinessCategory do
  menu parent: "Manage Business Card"
  permit_params :name, :description, :code, :slug, :priority, :publish, :category_type

  # Customize the index page
  index do
    selectable_column
    id_column
    column :name
    column :description
    column :code
    column :slug
    column :priority
    column :publish
    column :category_type
    actions
  end

  # Customize the form for creating/editing records
  form do |f|
    f.inputs 'Business Category Details' do
      f.input :name
      f.input :description
      f.input :code
      f.input :slug
      f.input :priority
      f.input :publish
      f.input :category_type
    end
    f.actions
  end

  # Add filters if necessary
  filter :name
  # filter :description
  # filter :code
  # filter :slug
  # filter :priority
  # filter :publish
  # filter :category_type
end
