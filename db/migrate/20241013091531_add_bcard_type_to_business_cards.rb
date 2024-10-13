class AddBcardTypeToBusinessCards < ActiveRecord::Migration[7.2]
  def change
    add_column :business_cards, :business_card_for, :integer
  end
end
