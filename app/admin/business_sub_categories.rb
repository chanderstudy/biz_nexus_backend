ActiveAdmin.register BusinessSubCategory do
  menu parent: "Manage Business Card"
  permit_params :name, :business_category_id, :description, :code, :slug, :priority, :publish

  # Customize the index page
  index do
    selectable_column
    id_column
    column :name
    column :business_category
    column :description
    column :code
    column :slug
    column :priority
    column :publish
    actions
  end

  # Customize the form for creating/editing records
  form do |f|
    f.inputs 'Business Sub Category Details' do
      f.input :name
      f.input :business_category, as: :select, collection: BusinessCategory.all.pluck(:name, :id)
      f.input :description
      f.input :code
      f.input :slug
      f.input :priority
      f.input :publish
    end
    f.actions
  end

  # Add filters if necessary
  filter :name
  filter :business_category, as: :select, collection: -> { BusinessCategory.pluck(:name, :id) }
  # filter :description
  # filter :code
  # filter :slug
  # filter :priority
  # filter :publish
end
