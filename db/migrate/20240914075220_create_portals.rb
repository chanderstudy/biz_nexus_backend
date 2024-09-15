class CreatePortals < ActiveRecord::Migration[6.1]
  def change
    create_table :portals do |t|
      t.string :portal_name
      t.string :portal_remark
      t.string :portal_url
      t.string :portal_msg
      t.integer :portal_status

      t.timestamps
    end
  end
end
