class BusinessSubCategory < ActiveRecord::Migration[7.2]
  def change
    create_table :business_sub_categories do |t|
      t.references :business_category, foreign_key: true
      t.string :name, limit: 128
      t.timestamps
    end
  end
end
