ActiveAdmin.register Service do
  permit_params :title, :description, :priority, :status, :logo, :banner, business_card_ids: []
  menu parent: "Miscellaneous"
  filter :title
	filter :description
	filter :priority
	filter :status, as: :select, collection: [["Active", 1], ["Inactive", 0]]
	# filter :business_cards, as: :select, collection: proc { BusinessCard.all.map { |bc| [bc.name, bc.id] } }
	filter :created_at
	filter :updated_at

  index do
    selectable_column
    id_column
    column :title
    column :description
    column :priority
    column :status
    column "Logo" do |service|
      if service.logo.attached?
        link_to image_tag(service.logo.variant(resize_to_limit: [50, 50])), service.logo_url, target: "_blank"
      end
    end
    column "Banner" do |service|
      if service.banner.attached?
        link_to image_tag(service.banner.variant(resize_to_limit: [100, 50])), service.banner_url, target: "_blank"
      end
    end
    actions
  end

  form do |f|
    f.inputs "Service Details" do
      f.input :title
      f.input :description
      f.input :priority
      f.input :status, as: :select, collection: ["Active", "Inactive"], include_blank: false
      f.input :logo, as: :file, hint: f.object.logo.attached? ? image_tag(f.object.logo.variant(resize_to_limit: [100, 100])) : "No logo uploaded"
      f.input :banner, as: :file, hint: f.object.banner.attached? ? image_tag(f.object.banner.variant(resize_to_limit: [200, 100])) : "No banner uploaded"
      f.input :business_cards, as: :select, collection: BusinessCard.pluck(:name, :id), input_html: { multiple: true }
    end
    f.actions
  end

  show do
    attributes_table do
      row :title
      row :description
      row :priority
      row :status
      row "Logo" do |service|
        if service.logo.attached?
          link_to image_tag(service.logo.variant(resize_to_limit: [100, 100])), service.logo_url, target: "_blank"
        end
      end
      row "Banner" do |service|
        if service.banner.attached?
          link_to image_tag(service.banner.variant(resize_to_limit: [200, 100])), service.banner_url, target: "_blank"
        end
      end
      row :created_at
      row :updated_at
    end

    panel "Associated Business Cards" do
      table_for service.business_cards do
        column :id
        column :name
        column :email
        column :mobile
        column :address
      end
    end
  end
end
