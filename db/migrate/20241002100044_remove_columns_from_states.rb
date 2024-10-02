class RemoveColumnsFromStates < ActiveRecord::Migration[7.2]
  def change
    remove_column :states, :estd_dd, :integer
    remove_column :states, :estd_mm, :integer
    remove_column :states, :estd_yy, :integer
    remove_column :states, :state_seo_kword, :string
    remove_column :states, :state_seo_mtag, :string
    remove_column :states, :state_seo_data, :text
    remove_column :states, :state_p_status, :boolean
    remove_column :states, :state_status, :boolean
  end
end
