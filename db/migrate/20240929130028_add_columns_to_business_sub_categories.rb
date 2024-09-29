class AddColumnsToBusinessSubCategories < ActiveRecord::Migration[7.2]
  def change
    add_column :business_sub_categories, :description, :string
    add_column :business_sub_categories, :code, :string
    add_column :business_sub_categories, :slug, :string
    add_column :business_sub_categories, :priority, :integer
    add_column :business_sub_categories, :publish, :boolean
  end
end
