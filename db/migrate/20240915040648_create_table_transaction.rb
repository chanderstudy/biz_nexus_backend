class CreateTableTransaction < ActiveRecord::Migration[7.2]
  def change
    create_table :transactions do |t|
      t.integer :payment_mode
      t.string :payment_id
      t.integer :amount
      t.integer :status
      t.string :remarks

      t.timestamps
    end
    add_index :transactions, :payment_id, unique: true 
  end
end
