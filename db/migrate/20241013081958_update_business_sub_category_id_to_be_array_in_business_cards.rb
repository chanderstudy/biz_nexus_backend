class UpdateBusinessSubCategoryIdToBeArrayInBusinessCards < ActiveRecord::Migration[7.2]
  def change
    remove_index :business_cards, name: "index_business_cards_on_business_sub_category_id"
    remove_column :business_cards, :business_sub_category_id, :bigint
    add_column :business_cards, :business_sub_category_ids, :integer, array: true, default: []
  end
end
