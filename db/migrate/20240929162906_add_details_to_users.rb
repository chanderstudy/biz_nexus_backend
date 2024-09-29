class AddDetailsToUsers < ActiveRecord::Migration[7.2]
  def change
    add_column :users, :name, :string
    add_column :users, :mobile, :string
    add_column :users, :sex, :string
    add_column :users, :blood_group, :string
    add_column :users, :address, :string
    add_column :users, :landmark, :string
    add_column :users, :qualification, :string
    add_column :users, :dob, :datetime
    add_column :users, :dom, :datetime
    add_column :users, :status, :boolean, default: false

    add_column :users, :portal_id, :bigint
    add_foreign_key :users, :portals, column: :portal_id

    add_column :users, :continent_id, :integer
    add_column :users, :country_id, :integer
    add_column :users, :state_id, :integer
    add_column :users, :dist_id, :integer
    add_column :users, :city_id, :integer
    add_column :users, :area_id, :string

    # Adding foreign keys
    add_foreign_key :users, :continents, column: :continent_id
    add_foreign_key :users, :countries, column: :country_id
    add_foreign_key :users, :states, column: :state_id, primary_key: :state_id
    add_foreign_key :users, :districts, column: :dist_id, primary_key: :dist_id
    add_foreign_key :users, :cities, column: :city_id, primary_key: :city_id
  end
end
