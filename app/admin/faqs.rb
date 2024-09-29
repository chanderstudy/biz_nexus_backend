ActiveAdmin.register Faq do
  # Define permitted parameters for strong parameters
  permit_params :question, :answer, :faqable_id, :faqable_type
  menu parent: "Miscellaneous"
  # Index view configuration
  index do
    selectable_column
    id_column
    column :question
    column :answer
    column :faqable_type
    column :faqable_id
    actions defaults: false do |faq|
      item "View", admin_faq_path(faq)
      item "Edit", edit_admin_faq_path(faq)
    end
  end

  # Show page configuration
  show do
    attributes_table do
      row :id
      row :question
      row :answer
      row :faqable_type
      row :faqable_id
      row :created_at
      row :updated_at
    end
    active_admin_comments
  end

  # Form configuration
  form do |f|
    f.inputs do
      f.input :question
      f.input :answer
      f.input :faqable_type, as: :select, collection: ['BusinessCard', 'Product']
      # `faqable_id` will be handled through another mechanism or JavaScript
      f.input :faqable_id#, as: :select, collection: []
    end
    f.actions
  end

  # Controller block to define methods and configurations
  controller do
    def fetch_faqable_options(type)
      case type
      when 'BusinessCard'
        BusinessCard.all.map { |b| ["BusinessCard ##{b.id}", b.id] }
      when 'Product'
        Product.all.map { |p| ["Product ##{p.id}", p.id] }
      else
        []
      end
    end
  end

  # Optionally, you could use a form partial to include JavaScript for dynamic updates
end
