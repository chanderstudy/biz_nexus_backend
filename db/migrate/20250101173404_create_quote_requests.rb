class CreateQuoteRequests < ActiveRecord::Migration[7.2]
  def change
    create_table :quote_requests do |t|
      t.references :quotable, polymorphic: true, null: false
      t.string :name
      t.string :email
      t.string :phone
      t.text :message
      t.integer :status

      t.timestamps
    end
  end
end
