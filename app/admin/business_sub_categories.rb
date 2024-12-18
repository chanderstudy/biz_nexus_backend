ActiveAdmin.register BusinessSubCategory do
  menu parent: "Manage Business Card"

  permit_params :name, :description, :code, :slug, :priority, :publish, :logo, :banner, business_category_ids: []

  before_action only: [:create, :update] do
    params[:business_sub_category][:business_category_ids].reject!(&:blank?) if params[:business_sub_category][:business_category_ids].present?
  end

  index do
    selectable_column
    id_column
    column :name
    column "Business Categories" do |sub_category|
      BusinessCategory.where(id: sub_category.business_category_ids).pluck(:name).join(', ')
    end
    column :description
    column :code
    column :slug
    column :priority
    column :publish
    actions
  end

  show do
    attributes_table do
      row :name
      row :description
      row :code
      row :slug
      row :priority
      row :publish
      row "Business Categories" do |sub_category|
        BusinessCategory.where(id: sub_category.business_category_ids).pluck(:name).join(', ')
      end
      if business_sub_category.logo.present?
        row "Logo" do |category|
          image_tag(category.logo,width:100,height:80)
        end
      end
      if business_sub_category.banner.present?
        row "Banner" do |category|
          image_tag(category.banner,width:100,height:80)
        end
      end
      row :created_at
      row :updated_at
    end
    active_admin_comments
  end

  form do |f|
    f.inputs 'Business Sub Category Details' do
      f.input :name, required: true
      f.input :business_category_ids, as: :select, collection: BusinessCategory.all.pluck(:name, :id), input_html: { multiple: true, required: true }
      f.input :description
      f.input :code
      f.input :slug
      f.input :logo, as: :file
      f.input :banner, as: :file
      f.input :priority
      f.input :publish
    end
    f.actions
  end

  filter :name
end
