class AddLocationReferencesToBusinessCards < ActiveRecord::Migration[7.2]
  def change
    change_table :business_cards do |t|
      t.references :state, null: true, foreign_key: { to_table: :states, primary_key: :state_id }
      t.references :district, null: true, foreign_key: { to_table: :districts, primary_key: :dist_id }
      t.references :city, null: true, foreign_key: { to_table: :cities, primary_key: :city_id }
      t.references :area, null: true, foreign_key: { to_table: :areas, primary_key: :area_id }
    end
  end
end
