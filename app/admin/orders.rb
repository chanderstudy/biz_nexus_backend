# app/admin/orders.rb
ActiveAdmin.register Order do
  # Permit parameters for create and update actions
  permit_params :order_invoice, :agent_id, :user_id, :placed_by, :plan_id, :description, 
                :mrp, :coupon, :discount, :extra_charge_details, :extra_charge, :gst, 
                :net_amount, :transaction_id, :payment_received_by, :subscription_id, 
                :order_remark, :status
  config.filters = false
  menu parent: "Orders & Payments"
  # Displaying columns in the index view
  index do
    selectable_column
    id_column
    column :order_invoice
    column :agent
    column :user
    column :placed_by
    column :plan
    column :description
    column :mrp
    column :coupon
    column :discount
    column :extra_charge_details
    column :extra_charge
    column :gst
    column :net_amount
    column :transaction_id
    column :payment_received_by
    column :subscription
    column :order_remark
    column :status
    actions
  end

  # Form for creating and editing orders
  form do |f|
    f.inputs do
      f.input :order_invoice
      f.input :agent, as: :select, collection: User.all
      f.input :user, as: :select, collection: User.all
      f.input :placed_by, as: :select, collection: User.all
      f.input :plan, as: :select, collection: Plan.all
      f.input :description
      f.input :mrp
      f.input :coupon, as: :text, input_html: { rows: 5, placeholder: 'Enter JSON data here' }
      f.input :discount
      f.input :extra_charge_details
      f.input :extra_charge
      f.input :gst
      f.input :net_amount, input_html: { readonly: true } # Calculated field
      f.input :transaction_record
      f.input :payment_received_by, as: :select, collection: User.all
      f.input :subscription, as: :select, collection: Subscription.all, include_blank: true
      f.input :order_remark
      f.input :status, as: :select, collection: Order.statuses.keys.map { |status| [status.humanize, status] }
    end
    f.actions
  end
end
