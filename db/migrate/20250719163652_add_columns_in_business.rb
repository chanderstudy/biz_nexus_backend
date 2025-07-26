class AddColumnsInBusiness < ActiveRecord::Migration[7.2]
  def change
    add_column :business_cards, :verified, :boolean
    add_column :business_cards, :trusted, :boolean
    add_column :business_cards, :trending, :boolean
    add_column :business_cards, :rating, :integer
    add_column :business_cards, :review_count, :integer
  end
end