class RemoveBusinessCategoryIdFromBusinessSubCategories < ActiveRecord::Migration[7.2]
  def change
    remove_column :business_sub_categories, :business_category_id, :bigint
    remove_column :business_cards, :business_category_id, :bigint
  end
end
