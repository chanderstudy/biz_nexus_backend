# app/admin/business_sub_categories.rb
ActiveAdmin.register BusinessSubCategory do
  menu parent: "Manage Business Card"
  permit_params :name, :business_category_id

  # Customize the index page
  index do
    selectable_column
    id_column
    column :name
    column :business_category
    actions
  end

  # Customize the form for creating/editing records
  form do |f|
    f.inputs 'Business Sub Category Details' do
      f.input :name
      f.input :business_category, as: :select, collection: BusinessCategory.all.pluck(:name, :id)
    end
    f.actions
  end

  # Add filters if necessary
  filter :name
  filter :business_category, as: :select, collection: -> { BusinessCategory.pluck(:name, :id) }
end
