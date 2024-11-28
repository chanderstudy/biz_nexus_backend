ActiveAdmin.register BusinessCategory do
  menu parent: "Manage Business Card"
  permit_params :name, :description, :code, :slug, :priority, :publish, :logo, :banner, :category_type

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
      f.input :logo, as: :file
      f.input :banner, as: :file
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

  show do
    attributes_table do
      row :name
      row :description
      row :code
      row :slug
      row :priority
      row :publish
      row :category_type
      if business_category.logo.present?
        row "Logo" do |category|
          image_tag(category.logo,width:100,height:80)
        end
      end
      if business_category.banner.present?
        row "Banner" do |category|
          image_tag(category.banner,width:100,height:80)
        end
      end
      row :created_at
      row :updated_at
    end
    active_admin_comments
  end
end
