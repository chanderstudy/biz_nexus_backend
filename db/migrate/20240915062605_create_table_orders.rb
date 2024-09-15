class CreateTableOrders < ActiveRecord::Migration[7.2]
  def change
    create_table :orders do |t|
      t.string :order_invoice
      t.references :agent, foreign_key: { to_table: :users }, index: true # Agent placing the order
      t.references :user, foreign_key: { to_table: :users }, index: true # User who placed the order (if self)
      t.references :placed_by, foreign_key: { to_table: :users }, index: true # Agent who placed the order
      t.references :plan, foreign_key: true # Reference to the plan table
      t.text :description
      t.integer :mrp
      t.jsonb :coupon
      t.integer :discount
      t.string :extra_charge_details
      t.integer :extra_charge
      t.integer :gst
      t.integer :net_amount
      t.references :transaction, foreign_key: true
      t.references :payment_received_by, foreign_key: { to_table: :users }, index: true
      t.references :subscription, foreign_key: true
      t.string :order_remark
      t.integer :status

      t.timestamps
    end
  end
end