class RenameCreatedByAndManagedByInBusinessCards < ActiveRecord::Migration[7.2]
  def change
    rename_column :business_cards, :created_by, :created_by_id
    rename_column :business_cards, :managed_by, :managed_by_id
  end
end
