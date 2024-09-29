class AddDetailsToAdminUsers < ActiveRecord::Migration[7.2]
  def change
    add_column :admin_users, :name, :string
    add_column :admin_users, :mobile, :string
    add_column :admin_users, :sex, :string
    add_column :admin_users, :blood_group, :string
    add_column :admin_users, :aadhar_card, :string, limit: 12
    add_column :admin_users, :pan_card, :string, limit: 10
    add_column :admin_users, :gst_number, :string, limit: 15
    add_column :admin_users, :address, :string
    add_column :admin_users, :landmark, :string
    add_column :admin_users, :qualification, :string
    add_column :admin_users, :pincode, :integer, limit: 6
    # add_column :admin_users, :post_office, :integer
    add_column :admin_users, :dob, :datetime
    add_column :admin_users, :dom, :datetime

    add_column :admin_users, :added_by, :bigint
    # add_column :admin_users, :role_id, :bigint
    add_column :admin_users, :portal_id, :bigint

    # Add foreign key constraints
    add_foreign_key :admin_users, :admin_users, column: :added_by
    # add_foreign_key :admin_users, :roles, column: :role_id
    add_foreign_key :admin_users, :portals, column: :portal_id

   # Adding location fields
    add_column :admin_users, :continent_id, :integer
    add_column :admin_users, :country_id, :integer
    add_column :admin_users, :state_id, :integer
    add_column :admin_users, :dist_id, :integer
    add_column :admin_users, :city_id, :integer
    add_column :admin_users, :area_id, :string

    # Adding foreign keys
    add_foreign_key :admin_users, :continents, column: :continent_id
    add_foreign_key :admin_users, :countries, column: :country_id
    add_foreign_key :admin_users, :states, column: :state_id, primary_key: :state_id
    add_foreign_key :admin_users, :districts, column: :dist_id, primary_key: :dist_id
    add_foreign_key :admin_users, :cities, column: :city_id, primary_key: :city_id
  end
end
