class UpdateBcardTable < ActiveRecord::Migration[7.2]
  def change
    remove_column :business_cards, :pstatus
    add_reference :business_cards, :portal
  end
end
