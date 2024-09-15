class CreateTableCoupon < ActiveRecord::Migration[7.2]
  def change
    create_table :coupons do |t|
      t.integer :type
      t.integer :created_for
      t.string :name
      t.string :code
      t.integer :percentage
      t.integer :fix_discount
      t.integer :max_discount
      t.datetime :start_date
      t.datetime :end_date
      t.string :description
      t.integer :priority
      t.integer :status

      t.timestamps
    end
  end
end
