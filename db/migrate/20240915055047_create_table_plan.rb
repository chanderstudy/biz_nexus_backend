class CreateTablePlan < ActiveRecord::Migration[7.2]
  def change
    create_table :plans do |t|
      t.string :name
      t.integer :price
      t.integer :discount
      t.integer :duration
      t.string :description
      t.integer :priority
      t.integer :status

      t.timestamps
    end
  end
end