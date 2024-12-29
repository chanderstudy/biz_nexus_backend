class AddColumnToBusinessCard < ActiveRecord::Migration[7.2]
  def change
    add_column :business_cards, :experience, :string
    add_column :business_cards, :opening_time, :time
    add_column :business_cards, :closing_time, :time
    add_column :business_cards, :smoking_area, :boolean
    add_column :business_cards, :parking, :boolean
    add_column :business_cards, :since, :integer
    add_column :business_cards, :online_booking, :boolean
  end
end
