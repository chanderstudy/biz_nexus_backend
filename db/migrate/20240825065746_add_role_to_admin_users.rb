class AddRoleToAdminUsers < ActiveRecord::Migration[7.2]
  def change
    add_reference :admin_users, :role, foreign_key: true, null: true
  end
end
