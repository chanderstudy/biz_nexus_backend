class AddManagedByToAdminUsers < ActiveRecord::Migration[7.2]
  def change
    add_column :admin_users, :managed_by, :bigint
  end
end
