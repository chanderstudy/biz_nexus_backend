ActiveAdmin.register Portal do
  # actions :index, :show, :new

  permit_params :portal_name, :portal_remark, :portal_url, :portal_msg, :portal_status
  filter :portal_name
  menu parent: "Miscellaneous"

  # Index view configuration
  index do
    selectable_column
    id_column
    column :portal_name
    column :portal_remark
    column :portal_url
    column :portal_msg
    column :portal_status
    actions defaults: false do |portal|
      item "View", admin_portal_path(portal)
    end
  end

  # Show page configuration
  show do
    attributes_table do
      row :id
      row :portal_name
      row :portal_remark
      row :portal_url
      row :portal_msg
      row :portal_status
      row :created_at
      row :updated_at
    end
    active_admin_comments
  end

  # Disable form actions (since no edit/create access)
  config.clear_action_items!
end
