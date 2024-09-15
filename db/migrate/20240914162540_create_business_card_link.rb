class CreateBusinessCardLink < ActiveRecord::Migration[7.2]
  def change
    create_table :business_card_links do |t|
      t.references :business_card, foreign_key: true
      t.integer :type
      t.integer :priority
      t.string :title
      t.string :url
      t.integer :status

      t.timestamps
    end
  end
end
