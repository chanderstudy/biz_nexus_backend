ActiveAdmin.register QuoteRequest do
  permit_params :quotable_type, :quotable_id, :name, :email, :phone, :message, :status

  index do
    selectable_column
    id_column
    column :quotable
    column :name
    column :email
    column :phone
    column :message
    column :status
    column :created_at
    column :updated_at
    actions
  end

  form do |f|
    f.inputs do
      f.input :quotable_type, as: :select, collection: ['BusinessCard']
      f.input :quotable_id
      f.input :name
      f.input :email
      f.input :phone
      f.input :message
      f.input :status, as: :select, collection: QuoteRequest.statuses.keys
    end
    f.actions
  end
end
