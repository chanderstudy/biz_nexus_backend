class BusinessCategory < ActiveRecord::Migration[7.2]
  def change
    create_table :business_categories do |t|
      t.string :name, limit: 128
      t.timestamps
    end
  end
end
