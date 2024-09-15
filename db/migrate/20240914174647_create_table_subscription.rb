class CreateTableSubscription < ActiveRecord::Migration[7.2]
  def change
    create_table :subscriptions do |t|
      t.string :name
      t.float :price
      t.integer :duration
      t.string :description
      t.integer :priority
      t.integer :status

      t.timestamps
    end
  end
end

