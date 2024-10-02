class AddBusinessCategoryIdsToBusinessSubCategories < ActiveRecord::Migration[7.2]
  def change
    add_column :business_sub_categories, :business_category_ids, :integer, array: true, default: []
    # add_index :business_sub_categories, :business_category_ids, using: 'gin'
  end
end
